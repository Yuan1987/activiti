package com.dynastech.model.service.impl;

import com.dynastech.base.common.service.impl.CommonService;
import com.dynastech.base.file.FilenameUtils;
import com.dynastech.base.file.IFileSystemService;
import com.dynastech.base.util.BeanUtils;
import com.dynastech.base.util.SpringUtils;
import com.dynastech.common.service.impl.DictionaryService;
import com.dynastech.model.entity.*;
import com.dynastech.model.mapper.AttachmentFileMapper;
import com.dynastech.model.mapper.SysAbilityMapper;
import com.dynastech.model.mapper.SysEvaluationFormAbilityMapper;
import com.dynastech.model.mapper.SysEvaluationFormMapper;
import com.dynastech.model.service.ISysEvaluationformService;
import com.sun.tools.internal.ws.wsdl.document.jaxws.Exception;
import org.activiti.engine.runtime.Execution;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by ganlu on 2017/9/18.
 */

@Service
public class SysEvaluationformService implements ISysEvaluationformService {


    @Autowired
    private SysEvaluationFormMapper sysEvaluationFormMapper;

    @Autowired
    private SysEvaluationFormAbilityMapper sysEvaluationFormAbilityMapper;

    @Autowired
    private SysAbilityMapper sysAbilityMapper;

    @Autowired
    private AttachmentFileMapper fileMapper;

    @Autowired
    private CommonService commonService;



    @Autowired
    private IFileSystemService fileService;


    /**
     * 评测表列表
     * @param sysEvaluationFormExample
     * @return
     */
    @Override
    public List<SysEvaluationForm> getSysEvaluationFormList(SysEvaluationFormExample  sysEvaluationFormExample) {
        return sysEvaluationFormMapper.selectByExample(sysEvaluationFormExample);
    }

    @Override
    public SysEvaluationForm getSysEvaluationForm(String id) {
        return sysEvaluationFormMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SysAbility> getSysAbilities(String id) {
        SysEvaluationFormAbilityExample cond = new SysEvaluationFormAbilityExample();
        SysEvaluationFormAbilityExample.Criteria c = cond.createCriteria();
        c.andEvaluationformidEqualTo(id);
        List<String> li = new ArrayList();
        sysEvaluationFormAbilityMapper.selectByExample(cond).forEach(s -> {
            li.add(s.getAbilityid());
        });
        SysAbilityExample cond2 = new SysAbilityExample();
        SysAbilityExample.Criteria c2 = cond2.createCriteria();
        c2.andIdIn(li);
        return sysAbilityMapper.selectByExample(cond2);
    }

    @Override
    public AttachmentFile getAttachmentFile(String guid) {

        return fileMapper.selectByPrimaryKey(guid);
    }

    /**
     * 保存评测表
     * @param sysEvaluationForm
     * @return
     */
    @Override
    public int addSysEvaluationForm(SysEvaluationForm sysEvaluationForm) {
        return sysEvaluationFormMapper.insert(sysEvaluationForm);
    }


    /**
     * 修改评测表
     * @param sysEvaluationForm
     * @return
     */
    @Override
    public int editSysEvaluationForm(SysEvaluationForm sysEvaluationForm) {
        return sysEvaluationFormMapper.updateByPrimaryKeySelective(sysEvaluationForm);
    }


    /**
     *
     * 新增评测表和能力项
     * @param sysEvaluationForm
     * @param sysAbilities
     */
    @Transactional
    @Override
    public void addSysEvaluationFormAndAbility(MultipartFile file,SysEvaluationForm sysEvaluationForm, List<SysAbility> sysAbilities)
            throws java.lang.Exception {
        AttachmentFile attachmentFile=getAttachmentFile(file);
        sysEvaluationForm.setId(UUID.randomUUID().toString());
        sysEvaluationForm.setIsdeleted(false);
        sysEvaluationForm.setDatetimecreated(new Date());
        sysEvaluationForm.setStandardfile(attachmentFile.getGuid());
        //保存测评表
        sysEvaluationFormMapper.insert(sysEvaluationForm);
        //保存能力项
        saveAbility(sysEvaluationForm, sysAbilities);
        if (attachmentFile != null) {
            fileMapper.insert(attachmentFile);
        }
    }

    private AttachmentFile getAttachmentFile(MultipartFile file) throws java.lang.Exception
    {
        AttachmentFile attachmentFile = null;
        if(!file.isEmpty()) {
            attachmentFile=new AttachmentFile();
            //上传物理文件
            String keyId= UUID.randomUUID().toString();
            String fileName =keyId + "." + FilenameUtils.getExtensionName(file.getOriginalFilename());
            String path = commonService.getCurrentUserName() + "/" + fileName;
            fileService.save(file, path);
            //文件信息
            attachmentFile.setGuid(keyId);
            attachmentFile.setUserguid(commonService.getCurrentUserName());
            attachmentFile.setIsfolder(0);
            attachmentFile.setPid("");
            attachmentFile.setFilename(fileName);
            attachmentFile.setFriendlyfilename(file.getOriginalFilename());
            attachmentFile.setFilecontenttype(file.getContentType());
            attachmentFile.setFilesize( file.getSize());
            attachmentFile.setFilephysicalpath(path);
            attachmentFile.setIsdeleted(0);
            attachmentFile.setCreatetime(new Date());
            attachmentFile.setCreateuserid(commonService.getCurrentUser().getId());
        }
        return attachmentFile;
    }

    private void saveAbility(SysEvaluationForm sysEvaluationForm, List<SysAbility> sysAbilities) throws  java.lang.Exception {
        for (SysAbility sysAbility : sysAbilities) {
            //新增能力项
            if (StringUtils.isBlank(sysAbility.getId())) {
                sysAbility.setId(UUID.randomUUID().toString());
                sysAbility.setDatetimecreated(new Date());
                sysAbility.setSerial(sysEvaluationForm.getSerial());
                sysAbility.setThelevel(sysEvaluationForm.getLevel());
                sysAbility.setDatetimemodified(new Date());
                sysAbility.setIsdeleted(false);
                sysAbilityMapper.insert(sysAbility);

            }
            //保存关系表
            SysEvaluationFormAbility entiry = new SysEvaluationFormAbility();
            entiry.setId(UUID.randomUUID().toString());
            entiry.setAbilityid(sysAbility.getId());
            entiry.setEvaluationformid(sysEvaluationForm.getId());
            sysEvaluationFormAbilityMapper.insert(entiry);
        }
    }

    /**
     *
     * 修改评测表和能力项
     * @param sysEvaluationForm
     * @param sysAbilities
     * @throws Exception
     */
    @Transactional
    @Override
    public void editSysEvaluationFormAndAbility(MultipartFile file,SysEvaluationForm sysEvaluationForm, List<SysAbility> sysAbilities) throws java.lang.Exception {
        //原数据
        SysEvaluationForm oldevalInfo=sysEvaluationFormMapper.selectByPrimaryKey(sysEvaluationForm.getId());
        sysEvaluationForm.setDatetimecreated(oldevalInfo.getDatetimecreated());
        sysEvaluationForm.setIsdeleted(oldevalInfo.getIsdeleted());
        sysEvaluationForm.setDatetimemodified(new Date());
        sysEvaluationForm.setStandardfile(oldevalInfo.getStandardfile());
        sysEvaluationForm.setTotal(oldevalInfo.getTotal());
        sysEvaluationForm.setStatus(oldevalInfo.getStatus());
        //删除附件
        if(!file.isEmpty()) {
            AttachmentFile afile= fileMapper.selectByPrimaryKey(sysEvaluationForm.getStandardfile());
            fileService.delete(afile.getFilephysicalpath());
            fileMapper.deleteByPrimaryKey(sysEvaluationForm.getStandardfile());
        }
        //新增附件
        AttachmentFile attachmentFile=getAttachmentFile(file);
        if (attachmentFile != null) {
            fileMapper.insert(attachmentFile);
            sysEvaluationForm.setStandardfile(attachmentFile.getGuid());
        }


        //更新测评表
        sysEvaluationFormMapper.updateByPrimaryKey(sysEvaluationForm);
        //删除测评表和能力项关联表
        SysEvaluationFormAbilityExample cond = new SysEvaluationFormAbilityExample();
        SysEvaluationFormAbilityExample.Criteria c = cond.createCriteria();
        c.andEvaluationformidEqualTo(sysEvaluationForm.getId());
        List<SysEvaluationFormAbility> listAbilities=  sysEvaluationFormAbilityMapper.selectByExample(cond);
        for(SysEvaluationFormAbility sfb :listAbilities) {
            sysEvaluationFormAbilityMapper.deleteByPrimaryKey(sfb.getId());
        }

        //删除能力项
        for (SysAbility sysAbility : sysAbilities) {
            if (!StringUtils.isBlank(sysAbility.getId())) {
                sysAbilityMapper.deleteByPrimaryKey(sysAbility.getId());
            }
        }


        //保存能力项
        saveAbility(sysEvaluationForm, sysAbilities);

    }


    /**
     * 逻辑删除评测表和能力项
     * @param guid
     * @return
     */
    @Transactional
    @Override
    public void deleteSysEvaluationFormAndAbility(String guid) throws java.lang.Exception {
        SysEvaluationForm sysEvaluationForm = sysEvaluationFormMapper.selectByPrimaryKey(guid);
        if (sysEvaluationForm == null)
            return;

        //删除能力项与评测表关系
        SysEvaluationFormAbilityExample cond = new SysEvaluationFormAbilityExample();
        SysEvaluationFormAbilityExample.Criteria c = cond.createCriteria();
        c.andEvaluationformidEqualTo(sysEvaluationForm.getId());
        List<SysEvaluationFormAbility> listAbilities=  sysEvaluationFormAbilityMapper.selectByExample(cond);
        for(SysEvaluationFormAbility sfb :listAbilities) {
            //暂时不要删除能力项
           // sysAbilityMapper.deleteByPrimaryKey(sfb.getAbilityid());
            sysEvaluationFormAbilityMapper.deleteByPrimaryKey(sfb.getId());
        }

        //逻辑删除评测表
        sysEvaluationForm.setIsdeleted(true);
         sysEvaluationFormMapper.updateByPrimaryKeySelective(sysEvaluationForm);
    }

	@Override
	public int updateStatus(SysEvaluationForm sysEvaluationForm) {
		
		return sysEvaluationFormMapper.updateByPrimaryKeySelective(sysEvaluationForm);
	}

	




}
