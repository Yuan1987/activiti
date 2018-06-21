package com.dynastech.model.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Vector;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dynastech.base.common.service.impl.CommonService;
import com.dynastech.base.util.DateUtil;
import com.dynastech.base.util.I18nUtil;
import com.dynastech.model.entity.Apply;
import com.dynastech.model.entity.ModelEnum;
import com.dynastech.model.entity.ApplyExample;
import com.dynastech.model.entity.ApplyWithEval;
import com.dynastech.model.entity.CheckDetail;
import com.dynastech.model.entity.CheckDetailExample;
import com.dynastech.model.mapper.ApplyMapper;
import com.dynastech.model.mapper.CheckDetailMapper;
import com.dynastech.model.service.IApplyService;
import com.dynastech.system.entity.Organization;
import com.dynastech.system.entity.OrganizationExample;
import com.dynastech.system.entity.Role;
import com.dynastech.system.entity.User;
import com.dynastech.system.service.IOrgManagerService;
import com.dynastech.system.service.IRoleManagerService;

@Service
public class ApplyService implements IApplyService{
	
	@Autowired
	private ApplyMapper applyMapper;
	
	@Autowired
	private CheckDetailMapper checkDetailMapper;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private IRoleManagerService roleManagerService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	IOrgManagerService orgManagerService;
	
	
	@Override
	public int add(Apply apply) {
		return applyMapper.insert(apply);
	}
	
	@Override
	public Apply findById(String id) {
		return applyMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public List<Apply> selectByExample(ApplyExample example) {
		return applyMapper.selectByExample(example);
	}
	
	@Override
	public int update(Apply apply) {
		return applyMapper.updateByPrimaryKeySelective(apply);
	}
	
	@Override
	public int update(ApplyExample example,Apply apply) {
		return applyMapper.updateByExampleSelective(apply, example);
	}
	
	@Override
	@Transactional
	public Map<String, Object> check(CheckDetail cd) {
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		User user=commonService.getCurrentUser();
		String userId=user.getId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean pass=cd.getResult();
		String taskId=cd.getTaskid();
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		String taskName=task.getName();
		String applyId=cd.getApplyid();
		Apply  apply=applyMapper.selectByPrimaryKey(applyId);
		map.put("pass", pass);
		if(!pass){//不通过
			apply.setStatus(ModelEnum.STATUS_3.getValue());
		}else{//通过
			String dept="";
			if(ModelEnum.flow_NODE1_NAME.getValue().equals(taskName)){
				dept=ModelEnum.flow_NODE2_NAME.getValue();
			}else if(ModelEnum.flow_NODE2_NAME.getValue().equals(taskName)){
				dept=ModelEnum.flow_NODE3_NAME.getValue();
			}
			
			if(!ModelEnum.flow_NODE3_NAME.getValue().equals(taskName)){// 不是序列小组  不是最后一个节点
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
				apply.setStatus(ModelEnum.STATUS_2.getValue());
			}
		}
		applyMapper.updateByPrimaryKeySelective(apply);
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
	public List<CheckDetail> selectDetailsById(String id) {
		
		CheckDetailExample cde=new CheckDetailExample();
		
		cde.createCriteria().andApplyidEqualTo(id);
		
		cde.setOrderByClause("createdTime");
		
		return checkDetailMapper.selectByExample(cde);
	}
	
	@Override
	public List<ApplyWithEval> selectApplyWithEval(String userId, String status) {
		return applyMapper.selectApplyWithEval(userId, status);
	}
	
	@Override
	public ApplyWithEval selectApplyWithEvalByEFId(String efId) {
		return applyMapper.selectApplyWithEvalByEFId(efId);
	}
}
