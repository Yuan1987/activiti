package com.dynastech.model.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Vector;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.dynastech.base.common.service.impl.CommonService;
import com.dynastech.base.file.IFileSystemService;
import com.dynastech.base.util.DateUtil;
import com.dynastech.base.util.I18nUtil;
import com.dynastech.model.entity.ModelEnum;
import com.dynastech.model.entity.AttachmentFile;
import com.dynastech.model.entity.AttachmentFileExample;
import com.dynastech.model.entity.AttachmentFileRelation;
import com.dynastech.model.entity.AttachmentFileRelationExample;
import com.dynastech.model.entity.CheckDetail;
import com.dynastech.model.entity.PersonAbility;
import com.dynastech.model.entity.PersonAbilityEvaluate;
import com.dynastech.model.entity.PersonAbilityEvaluateExample;
import com.dynastech.model.entity.PersonEvaluationform;
import com.dynastech.model.entity.PersonEvaluationformAbility;
import com.dynastech.model.entity.PersonEvaluationformExample;
import com.dynastech.model.entity.SysAbility;
import com.dynastech.model.entity.SysEvaluationForm;
import com.dynastech.model.entity.SysEvaluationFormExample;
import com.dynastech.model.mapper.AttachmentFileMapper;
import com.dynastech.model.mapper.AttachmentFileRelationMapper;
import com.dynastech.model.mapper.CheckDetailMapper;
import com.dynastech.model.mapper.PersonAbilityEvaluateMapper;
import com.dynastech.model.mapper.PersonAbilityMapper;
import com.dynastech.model.mapper.PersonEvaluationformAbilityMapper;
import com.dynastech.model.mapper.PersonEvaluationformMapper;
import com.dynastech.model.service.IPersonEvaluationFormService;
import com.dynastech.model.service.ISysEvaluationformService;
import com.dynastech.system.entity.Organization;
import com.dynastech.system.entity.OrganizationExample;
import com.dynastech.system.entity.Role;
import com.dynastech.system.entity.User;
import com.dynastech.system.service.IOrgManagerService;
import com.dynastech.system.service.IRoleManagerService;
import com.dynastech.system.service.IUserManagerService;

@Service
public class PersonEvaluationFormService implements IPersonEvaluationFormService {

	@Autowired
	private PersonEvaluationformMapper prfMapper;

	@Autowired
	private PersonAbilityMapper paMapper;

	@Autowired
	private PersonEvaluationformAbilityMapper pefaMapper;

	@Autowired
	private ISysEvaluationformService sefService;

	@Autowired
	private IFileSystemService fileSystemService;
	
	@Autowired
    private AttachmentFileMapper fileMapper;
	
	@Autowired
	private AttachmentFileRelationMapper afrMapper;
	
	@Autowired
	private CommonService commonService; 
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private IOrgManagerService orgManagerService;
	
	@Autowired
	private IRoleManagerService roleManagerService;
	
	@Autowired
	private CheckDetailMapper checkDetailMapper;
	
	@Autowired
	private PersonAbilityEvaluateMapper paeMapper;
	
	@Autowired
	private IUserManagerService userManagerService;
	

	@Override
	public int add(PersonEvaluationform pef) {
		return 0;
	}
	
	@Override
	public int update(PersonEvaluationform pef) {
		return prfMapper.updateByPrimaryKeySelective(pef);
	}

	@Override
	public List<PersonEvaluationform> selectByExample(PersonEvaluationformExample example) {
		return prfMapper.selectByExample(example);
	}
	
	@Override
	public PersonEvaluationform findById(String id) {
		return prfMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional
	public String initPersonEvaluationForm(String userId, String applyId, String serial, String level) {

		String pefId = "";

		SysEvaluationFormExample sefe = new SysEvaluationFormExample();
		sefe.createCriteria().andSerialEqualTo(serial).andLevelEqualTo(level)
				.andStatusEqualTo(SysEvaluationForm.STUTUS_1).andIsdeletedEqualTo(false);
		sefe.setOrderByClause("version desc");
		List<SysEvaluationForm> formList = sefService.getSysEvaluationFormList(sefe);
		List<SysAbility> list = null;
		if (!formList.isEmpty()) {

			// 循环调用 暂不考虑性能

			SysEvaluationForm sef = formList.get(0);

			list = sefService.getSysAbilities(sef.getId());

			PersonEvaluationform pef = new PersonEvaluationform();

			Date now = new Date();

			pefId = UUID.randomUUID().toString();

			pef.setId(pefId);
			pef.setDatetimecreated(now);
			pef.setDatetimemodified(now);
			pef.setUserid(userId);
			pef.setSysformid(sef.getId());
			pef.setName(sef.getName());
			pef.setSerial(sef.getSerial());
			pef.setLevel(sef.getLevel());
			pef.setVersion(sef.getVersion());
			pef.setPassmark(sef.getPassmark());
			pef.setAssessornumber(sef.getJudgesnumber());
			pef.setStandardfile(sef.getStandardfile());
			pef.setApplyid(applyId);
			pef.setIsdeleted(false);

			prfMapper.insert(pef);// 个人测评表

			for (SysAbility sa : list) {

				PersonAbility pa = new PersonAbility();

				String paId = UUID.randomUUID().toString();
				pa.setId(paId);
				pa.setUserid(userId);
				pa.setDatetimecreated(now);
				pa.setDatetimemodified(now);
				pa.setSysAbilityid(sa.getId());
				pa.setName(sa.getName());
				pa.setTypeid(sa.getTypeid());
				pa.setSerial(sa.getSerial());
				pa.setThelevel(sa.getThelevel());
				pa.setEvidence(sa.getEvidence());
				pa.setScore(sa.getScore());
				pa.setPassmark(sa.getPassmark());

				paMapper.insert(pa);// 个人能力项
				PersonEvaluationformAbility pefa = new PersonEvaluationformAbility();
				pefa.setId(UUID.randomUUID().toString());
				pefa.setEvaluationformid(pefId);
				pefa.setAbilityid(paId);

				pefaMapper.insert(pefa);// 关联关系表
			}

		}
		return pefId;
	}

	
	/**
	 * 2017年9月29日此方法过多的次的访问数据库、过多循环 待优化
	 * 
	 * 2017年10月11日  已优化
	 * **/
	@Override
	public List<PersonAbility> findPersonAbilityByEvalId(String peId) {
		return paMapper.selectFullPersonAbility(peId);
	}
	
	@Override
	public PersonAbility findPersonAbilityByPaId(String paId) {
		
		PersonAbility pa= new PersonAbility();
		pa.setId(paId);
		
		AttachmentFileRelationExample afre=new AttachmentFileRelationExample();
		
		afre.createCriteria().andYwidEqualTo(paId);
		
		List<AttachmentFileRelation> afrList= afrMapper.selectByExample(afre);
		
		List<String> afIds=new Vector<String>();
		
		afrList.forEach(af->{
			afIds.add(af.getFileid());
		});
		
		if(!afIds.isEmpty()){
			AttachmentFileExample afe=new AttachmentFileExample();
			afe.createCriteria().andGuidIn(afIds);
			afe.setOrderByClause("guid desc");
			List<AttachmentFile> fileList= fileMapper.selectByExample(afe);
			pa.setFiles(fileList);
		}
		
		return pa;
	}
	

	@Override
	public int updatePersonAbility(PersonAbility pa) {
		return paMapper.updateByPrimaryKeySelective(pa);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int uploadFile(String paId, String userId, MultipartFile[] file,String fileids,String descriptions,String newdescriptions) throws Exception {

		String[] newd=newdescriptions.split(",");
		
		String [] oldfileIds=fileids.split(",");
		String [] oldd=descriptions.split(",");
		
		for(int i=0;i<oldfileIds.length;i++){
			AttachmentFile af = new AttachmentFile();
			af.setGuid(oldfileIds[i]);
			af.setDescription(oldd[i]);
			fileMapper.updateByPrimaryKeySelective(af);
		}
		
		for (int i=0;i<file.length;i++) {

			String fileId = UUID.randomUUID().toString();
			String OriginalName= file[i].getOriginalFilename();
			String cfileName = OriginalName.substring(OriginalName.lastIndexOf("."), OriginalName.length());
			String path = userId + "/" + UUID.randomUUID().toString() + cfileName;

			AttachmentFile af = new AttachmentFile();
			af.setGuid(fileId);
			af.setUserguid(userId);
			af.setIsfolder(0);
			af.setPid("");
			af.setFilename(cfileName);
			af.setFriendlyfilename(OriginalName);
			af.setFilecontenttype(file[i].getContentType());
			af.setFilesize(file[i].getSize());
			af.setFilephysicalpath(path);
			af.setIsdeleted(0);
			af.setCreatetime(new Date());
			af.setCreateuserid(userId);
			af.setDescription(newd[i]);
			fileMapper.insert(af);

			AttachmentFileRelation afr = new AttachmentFileRelation();
			afr.setId(UUID.randomUUID().toString());
			afr.setYwid(paId);
			afr.setFileid(fileId);
			
			afrMapper.insert(afr);
			
			fileSystemService.save(file[i], path);

		}
		return 1;
	}
	
	@Override
	public int deleteFile(String fileId,String paId){
		
		AttachmentFileRelationExample afre=new AttachmentFileRelationExample();
		afre.createCriteria().andFileidEqualTo(fileId).andYwidEqualTo(paId);

		return afrMapper.deleteByExample(afre);
	}
	
	@Override
	public Map<String, Object> check(CheckDetail cd) {
		Map<String, Object> data = new HashMap<String, Object>();
		
		User user=commonService.getCurrentUser();
		String userId=user.getId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean pass=cd.getResult();
		String taskId=cd.getTaskid();
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		String taskName=task.getName();
		String efId=cd.getApplyid();
		PersonEvaluationform  pef=prfMapper.selectByPrimaryKey(efId);
		map.put("pass", pass);
		if(!pass){//不通过
			pef.setStatus(ModelEnum.EVALSTATUS_3.getValue());
			if(ModelEnum.efflow_NODE5_NAME.getValue().equals(taskName)){//汇总未通过 就是测评未通过
				pef.setStatus(ModelEnum.EVALSTATUS_4.getValue());
			}
		}else{//通过
			String dept="";
			if(ModelEnum.efflow_NODE1_NAME.getValue().equals(taskName)){
				dept=ModelEnum.efflow_NODE2_NAME.getValue();
			}else if(ModelEnum.efflow_NODE2_NAME.getValue().equals(taskName)){
				dept=ModelEnum.efflow_NODE3_NAME.getValue();
			}
			
			if(!ModelEnum.efflow_NODE5_NAME.getValue().equals(taskName)){// 不是汇总  不是最后一个节点
				
				OrganizationExample oe=new OrganizationExample();
				oe.createCriteria().andNameEqualTo(dept);
				List<Organization>orgs= orgManagerService.selectByExample(oe);
				if(orgs.size()<1){
					data.put("message","未找到下一节点审批部门："+dept);
					return data;
				}
				
				List<String> orgIds= new Vector<String>();
				for(Organization org:orgs){
					orgIds.add(org.getId());
				}
				//查询该部门领导角色
				List<Role> roles=roleManagerService.selectRoleByOrgIds(orgIds,ModelEnum.LEADER_ROLE_ID.getValue());
				if(roles.size()<1){
					data.put("message","未找到["+dept+"]的领导角色");
					return data;
				}
				List<String> roleList=new ArrayList<String>();
				for(Role role:roles){
					roleList.add(role.getId());
				}
				map.put("userRole",roleList);
			}else{//最后节点
				pef.setStatus(ModelEnum.EVALSTATUS_2.getValue());
			}
		}
		prfMapper.updateByPrimaryKeySelective(pef);
		taskService.claim(taskId, userId);
		taskService.complete(taskId, map);
		cd.setId(UUID.randomUUID().toString());
		cd.setCreatedtime(DateUtil.dateToStr(new Date()));
		cd.setUserid(userId);
		cd.setUsername(user.getName());
		cd.setNodename(taskName);
		int a=checkDetailMapper.insert(cd);
		data.put("message", a > 0 ? I18nUtil.getTextValue("dynastech.common.operation.success"):I18nUtil.getTextValue("dynastech.common.operation.fail"));
		return data;
	}
	
	@Override
	@Transactional
	public Map<String, Object> chose(String efId,String taskId,String jsonData) {
		
		Map<String, Object> data = new HashMap<String, Object>();
		User user=commonService.getCurrentUser();
		String userId=user.getId();
		
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> listDatas = (List<Map<String,Object>>) JSONArray.parse(jsonData);
		
		Set<String> set=new HashSet<>();
		
		for(Map<String,Object> json:listDatas){
			
			String assessorid=(String)json.get("assessorid");
			String abilityid=(String)json.get("id");
			
			//删除此条能力项 对应的测评人
			PersonAbilityEvaluateExample paee=new PersonAbilityEvaluateExample();
			paee.createCriteria().andAbilityidEqualTo(abilityid);
			paeMapper.deleteByExample(paee);
			
			if(!StringUtils.isBlank(assessorid)){
				
				String [] assessorids=assessorid.split(",");
				
				for(String ids:assessorids){
					
					if(!StringUtils.isBlank(ids)){
						set.add(ids);
						PersonAbilityEvaluate pae=new PersonAbilityEvaluate();
						Date now=new Date();
						pae.setAbilityid(abilityid);
						pae.setAssessorid(ids);
						pae.setDatetimecreated(now);
						pae.setDatetimemodified(now);
						pae.setIsdeleted(false);
						pae.setEvaluationformid(efId);
						pae.setId(UUID.randomUUID().toString());
						pae.setAssessor(userManagerService.selectById(ids).getDisplayname());
						//新增此条能力项 对的应得测评人
						paeMapper.insert(pae);
					}
				}
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		//Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		//PersonEvaluationform  pef=prfMapper.selectByPrimaryKey(efId);
		map.put("users", set);
		//prfMapper.updateByPrimaryKeySelective(pef);
		taskService.claim(taskId, userId);
		taskService.complete(taskId, map);
		data.put("message", I18nUtil.getTextValue("dynastech.common.operation.success"));
		return data;
	}
	
	@Override
	public int markscore(String paeId, Double score) {
		
		PersonAbilityEvaluate pae=new PersonAbilityEvaluate();
		pae.setId(paeId);
		pae.setScoring(score);
		return paeMapper.updateByPrimaryKeySelective(pae);
	}
	
	@Override
	public Map<String, Object> scoring(CheckDetail cd) {
		Map<String, Object> data = new HashMap<String, Object>();
		User user=commonService.getCurrentUser();
		String userId=user.getId();
		Map<String, Object> map = new HashMap<String, Object>();
		boolean pass=cd.getResult();
		String taskId=cd.getTaskid();
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		String taskName=task.getName();
		String efId=cd.getApplyid();
		PersonEvaluationform  pef=prfMapper.selectByPrimaryKey(efId);
		map.put("pass", pass);
		if(!pass){//不通过
			pef.setStatus(ModelEnum.EVALSTATUS_4.getValue());
		}else{//通过
			String dept=ModelEnum.efflow_NODE3_NAME.getValue();
			OrganizationExample oe=new OrganizationExample();
			oe.createCriteria().andNameEqualTo(dept);
			List<Organization>orgs= orgManagerService.selectByExample(oe);
			if(orgs.size()<1){
				data.put("message","未找到下一节点审批部门："+dept);
				return data;
			}
			
			List<String> orgIds= new Vector<String>();
			for(Organization org:orgs){
				orgIds.add(org.getId());
			}
			//查询该部门领导角色
			List<Role> roles=roleManagerService.selectRoleByOrgIds(orgIds,ModelEnum.LEADER_ROLE_ID.getValue());
			if(roles.size()<1){
				data.put("message","未找到["+dept+"]的领导角色");
				return data;
			}
			List<String> roleList=new ArrayList<String>();
			for(Role role:roles){
				roleList.add(role.getId());
			}
			map.put("userRole",roleList);
		}
		prfMapper.updateByPrimaryKeySelective(pef);
		taskService.claim(taskId, userId);
		taskService.complete(taskId, map);
		cd.setId(UUID.randomUUID().toString());
		cd.setCreatedtime(DateUtil.dateToStr(new Date()));
		cd.setUserid(userId);
		cd.setUsername(user.getName());
		cd.setNodename(taskName);
		int a=checkDetailMapper.insert(cd);
		data.put("message", a > 0 ? I18nUtil.getTextValue("dynastech.common.operation.success"):I18nUtil.getTextValue("dynastech.common.operation.fail"));
		return data;
	}
	
	@Override
	@Transactional
	public int count(String jsonData) {
		
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> listDatas = (List<Map<String,Object>>) JSONArray.parse(jsonData);
		int i=0;
		for(Map<String,Object> json:listDatas){
			
			String abilityid=(String)json.get("id");
			Double scoring=Double.valueOf(json.get("scoring")+"");
			PersonAbility pa=new PersonAbility();
			pa.setId(abilityid);
			pa.setScoring(scoring);
			i=paMapper.updateByPrimaryKeySelective(pa);
		}	
		return i;
	}
}
