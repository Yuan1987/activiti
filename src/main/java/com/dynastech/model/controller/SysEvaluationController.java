package com.dynastech.model.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dynastech.base.common.service.impl.CommonService;
import com.dynastech.base.file.IFileSystemService;
import com.dynastech.base.log.LogType;
import com.dynastech.base.util.BeanUtils;
import com.dynastech.base.util.I18nUtil;
import com.dynastech.base.util.LogUtil;
import com.dynastech.common.service.impl.DictionaryService;
import com.dynastech.model.entity.*;
import com.dynastech.model.service.IAttachmentFileService;
import com.dynastech.model.service.ISysAbilityService;
import com.dynastech.model.service.ISysEvaluationformService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 功能：评测表管理
 */

@Controller
@RequestMapping("/system/base-evaluation")
public class SysEvaluationController {
    private static Logger logger = Logger.getLogger(SysEvaluationController.class);


    @Autowired
    private ISysEvaluationformService sysEvaluationformService;

    @Autowired
    private CommonService commonService;

    @Autowired
   private DictionaryService dicService;

    @Autowired
    private IFileSystemService fileService;

    @Autowired
    private ISysAbilityService sysAbilityService;

    @Autowired
    private IAttachmentFileService attachmentFileService;

    /**
     * 评测表首页
     * @return
     */
    //@RequiresPermissions("base-evalu:view")
    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/model/sys_evaluation");
        return mv;
    }

    /**
     * 评测表列表
     * @param request request对象
     * @param page 当前页
     * @param size 页大小
     * @param searchText  搜索文本
     * @return
     */
    // @RequiresPermissions("base-evalu:view")
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> list(HttpServletRequest request,
                             @RequestParam(value = "page", defaultValue = "1", required = false) int page,
                             @RequestParam(value = "size", defaultValue = "20", required = false) int size,
                             @RequestParam(value = "searchText", required = false) String searchText) {

        PageHelper.startPage(page, size);
        Map<String, Object> data = new HashMap();
        SysEvaluationFormExample cond = new SysEvaluationFormExample();
        SysEvaluationFormExample.Criteria c = cond.createCriteria();
        if (!StringUtils.isBlank(searchText)) {
            c.andNameLike("%" + searchText + "%");
        }
        c.andIsdeletedEqualTo(false);
        cond.setOrderByClause("name");
        List<SysEvaluationForm> list = sysEvaluationformService.getSysEvaluationFormList(cond);
        // 取分页信息
        PageInfo<SysEvaluationForm> pageInfo = new PageInfo<SysEvaluationForm>(list);
        data.put("rows", list);
        data.put("total", pageInfo.getTotal());
        return data;
    }

    /**
     * 获取能力类别
     * @param serial  序列
     * @param theLevel 等级
     * @return
     */
    @RequestMapping(value = "/getabilities", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getabilities(
                             @RequestParam("serial") String serial,
                             @RequestParam("theLevel") String theLevel  ) {

        Map<String, Object> map = new HashedMap();
        SysAbilityExample cond = new SysAbilityExample();
        SysAbilityExample.Criteria c = cond.createCriteria();
        c.andSerialEqualTo(serial)
                .andIsdeletedEqualTo(false)
                .andThelevelEqualTo(theLevel);
        cond.setOrderByClause("name");
        List<SysAbility> list = sysAbilityService.getSysAbilityList(cond);
        map.put("rows", list);
        return map;
    }


    /**
     * 新增测评表
     * @return
     */
    //@RequiresPermissions("base-evalu:add")
    @RequestMapping("/add.html")
    public ModelAndView add() {
        ModelAndView mv = new ModelAndView();
        List<com.dynastech.common.entity.Dictionary> dics = dicService.findByKind("sbxl");
        mv.addObject("dics_sbxl",dics);
        List<com.dynastech.common.entity.Dictionary> dics2 = dicService.findByKind("sbjb");
        mv.addObject("dics_ssjb",dics2);
        List<com.dynastech.common.entity.Dictionary> dics3 = dicService.findByKind("formula");
        mv.addObject("dics_formula",dics3);
        List<com.dynastech.common.entity.Dictionary> dics4 = dicService.findByKind("abilitykind");
        mv.addObject("dics_abilitykind",dics4);

        mv.setViewName("/model/sys_evaluation_add");
        return mv;
    }


    /**
     * 保存评测表
     * @param file
     * @param request
     * @return
     */
    //@RequiresPermissions("base-evalu:add")
    @RequestMapping(value="/save",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> add(@RequestParam("file")MultipartFile file,HttpServletRequest request) {
        String strEvaluationInfo = request.getParameter("hidEvaluationInfo");
        String abilityInfo = request.getParameter("hidabilityInfo");
        String operation= request.getParameter("operationtype");
        Map<String, Object> data = new HashMap();
        try {
            SysEvaluationRequest sysEvaluationRequest = JSON.parseObject(strEvaluationInfo, SysEvaluationRequest.class);
            List<SysAbilityRequest> sysAbilityRequest = JSONArray.parseArray(abilityInfo, SysAbilityRequest.class);
            //判断同一测评表能力项是否有重复
            if (new HashSet(sysAbilityRequest).size() != sysAbilityRequest.size()) {
                data.put("message", "能力项存在重复！");
                return data;
            }
            SysEvaluationForm sysEvaluationForm = new SysEvaluationForm();
            List<SysAbility> sysAbilitiesList = new ArrayList();
            BeanUtils.copy(sysEvaluationForm, sysEvaluationRequest);
            sysAbilityRequest.forEach(s -> {
                SysAbility sab = new SysAbility();
                try {
                    BeanUtils.copy(sab, s);
                    sysAbilitiesList.add(sab);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
            BeanUtils.copy(sysAbilitiesList, sysAbilityRequest);

            if ("add".equals(operation) ){
                sysEvaluationformService.addSysEvaluationFormAndAbility(file, sysEvaluationForm, sysAbilitiesList);
            } else {
                sysEvaluationformService.editSysEvaluationFormAndAbility(file, sysEvaluationForm, sysAbilitiesList);
            }
            data.put("message", I18nUtil.getTextValue("dynastech.common.operation.success"));
            LogUtil.addLog(logger, LogType.EVALU_ADD.getValue(), sysEvaluationForm.getId(), commonService.getCurrentUser());

        } catch (Exception e) {
            data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
            logger.error("OrgManagerController.add", e);
        }
        return data;
    }


    /**
     * 编辑测评表
     * @param id  单号
     * @return
     */
    @RequestMapping("/edit.html")
    public ModelAndView edit(String id) {
        ModelAndView mv = new ModelAndView();
        List<com.dynastech.common.entity.Dictionary> dics = dicService.findByKind("sbxl");
        mv.addObject("dics_sbxl",dics);
        List<com.dynastech.common.entity.Dictionary> dics2 = dicService.findByKind("sbjb");
        mv.addObject("dics_ssjb",dics2);
        List<com.dynastech.common.entity.Dictionary> dics3 = dicService.findByKind("formula");
        mv.addObject("dics_formula",dics3);
        SysEvaluationForm sysEvaluationForm=sysEvaluationformService.getSysEvaluationForm(id);

        List<com.dynastech.common.entity.Dictionary> dics4 = dicService.findByKind("abilitykind");
        mv.addObject("dics_abilitykind",dics4);

        mv.addObject("evalu_Info",sysEvaluationForm) ;
        List<SysAbility> abilities=sysEvaluationformService.getSysAbilities(id);
        mv.addObject("abilites",abilities);
        mv.addObject("fileInfo",sysEvaluationformService.getAttachmentFile(sysEvaluationForm.getStandardfile())) ;
        mv.setViewName("/model/sys_evaluation_edit");
        return mv;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    public Map<String,Object> delete(String id) {
        Map<String, Object> data = new HashMap();
        try {
            sysEvaluationformService.deleteSysEvaluationFormAndAbility(id);
            data.put("message", I18nUtil.getTextValue("dynastech.common.operation.success"));
            LogUtil.addLog(logger, LogType.EVALU_DELETE.getValue(), id, commonService.getCurrentUser());
        } catch (Exception ex) {
            data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
            logger.error("OrgManagerController.add", ex);
        }
        return data;
    }
    
    @ResponseBody
    @RequestMapping(value="/status",method=RequestMethod.POST)
    public Map<String,Object> editStatus(SysEvaluationForm sysEvaluationForm) {
        Map<String, Object> data = new HashMap<String, Object>();
        try {
            
        	sysEvaluationformService.updateStatus(sysEvaluationForm);

            data.put("message", I18nUtil.getTextValue("dynastech.common.operation.success"));
        } catch (Exception ex) {
            data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
            logger.error("OrgManagerController.add", ex);
        }
        return data;
    }
}
