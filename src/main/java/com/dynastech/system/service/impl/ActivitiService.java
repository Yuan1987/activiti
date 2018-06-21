package com.dynastech.system.service.impl;


import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricActivityInstanceQuery;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dynastech.system.service.IActivitiService;
@Service
@Transactional(propagation=Propagation.REQUIRED)
public class ActivitiService implements IActivitiService{

	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private HistoryService historyService;
	

	/*
	 * 启动一个流程
	 * */
	@Override
	public ProcessInstance startProcess(String userId,String key, String businesskey, Map<String,Object> map) {
		identityService.setAuthenticatedUserId(userId);
		return runtimeService.startProcessInstanceByKey(key, businesskey, map);
	}

	@Override
	public ProcessInstance createProcess(String key){
		return runtimeService.startProcessInstanceByKey(key);
	}
	
	@Override
	public Task getTask(String taskId){
		return taskService.createTaskQuery().taskId(taskId).singleResult();
	}
	
	/**
	 * 
	 * @param processInstanceId
	 * @return
	 */
	@Override
	public Task getTaskByDfId(String processInstanceId){
		return taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
	}
	
	@Override
	public List<Task> querytodoListByRole(List<String> roles,String key,int page,int size){
		List<Task> taskCandidates=taskService.createTaskQuery().processDefinitionKey(key).taskCandidateGroupIn(roles).orderByTaskPriority().desc().listPage(page-1,size);
		return taskCandidates;
	}
	
	@Override
	public List<Task> querytodoListByAssignee(String userId, String key, int page, int size) {
		List<Task> taskCandidates=taskService.createTaskQuery().processDefinitionKey(key).taskAssignee(userId).orderByTaskPriority().desc().listPage(page-1,size);
		return taskCandidates;
	}
	
	@Override
	public long querytodoCountByRole(List<String> roles,String key) {
		return taskService.createTaskQuery().processDefinitionKey(key).taskCandidateGroupIn(roles).count();
	}
	
	@Override
	public long querytodoCountByAssignee(String userId, String key) {
		return taskService.createTaskQuery().processDefinitionKey(key).taskAssignee(userId).count();
	}
	
	@Override
	public List<HistoricActivityInstance> getHisUserTaskActivityInstanceList(String businessKey){
		
		HistoricProcessInstance hisProcessInstance = (HistoricProcessInstance) historyService
				.createHistoricProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();

		List<HistoricActivityInstance> hisList = ((HistoricActivityInstanceQuery) historyService
				.createHistoricActivityInstanceQuery().processInstanceId(hisProcessInstance.getId()).finished()
				.orderByHistoricActivityInstanceEndTime().desc()).list();

		return hisList;
	}
	
	@Override
	public List<HistoricTaskInstance> historyTaskList(String userId,List<String> roles,String key,boolean status,int page,int size){
		
		List<HistoricTaskInstance> list = null;
		
		page=page-1;
		
		if(status){
			list=historyService.createHistoricTaskInstanceQuery().processDefinitionKey(key).taskAssignee(userId).finished()
					.orderByTaskDueDate().desc().listPage(page, size);
		}else{
			list=historyService.createHistoricTaskInstanceQuery().processDefinitionKey(key).taskCandidateGroupIn(roles).unfinished()
					.orderByTaskDueDate().desc().listPage(page, size);
		}
		
		return list;
	}
	
	@Override
	public long historyTaskCount(String userId,List<String> roles,String key,boolean status) {
		long count = 0;
		
		if(status){
			count=historyService.createHistoricTaskInstanceQuery().processDefinitionKey(key).taskAssignee(userId).finished().count();
		}else{
			count=historyService.createHistoricTaskInstanceQuery().processDefinitionKey(key).taskCandidateGroupIn(roles).unfinished().count();
		}
		return count;
	}

	
}
