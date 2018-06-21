package com.dynastech.system.service;

import java.util.List;
import java.util.Map;

import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

public interface IActivitiService {
	
	/**
	 * 启动流程
	 * 
	 * @param userId
	 * @param key
	 * @param businesskey
	 * @param map
	 * @return
	 */
	ProcessInstance startProcess(String userId,String key, String businesskey, Map<String,Object> map);
	
	ProcessInstance createProcess(String key);
	
	Task getTask(String taskId);
	
	Task getTaskByDfId(String processInstanceId);
	
	/**
	 * 待办查询  (角色方式)
	 * @param roles 
	 * @param key 流程的key
	 * @param page
	 * @param size
	 * @return
	 */
	List<Task> querytodoListByRole(List<String> roles,String key,int page,int size);
	
	/**
	 * 待办查询  （具体办理人）
	 * @param roles 
	 * @param key 流程的key
	 * @param page
	 * @param size
	 * @return
	 */
	List<Task> querytodoListByAssignee(String userId,String key,int page,int size);
	
	/**
	 * 待办条数
	 * @param roles
	 * @param key
	 * @return
	 */
	long querytodoCountByRole(List<String> roles,String key);
	
	
	/**
	 * 待办条数
	 * @param roles
	 * @param key
	 * @return
	 */
	long querytodoCountByAssignee(String userId,String key);
	
	/**
	 * 查询本人的历史任务  （包含了 未完成的任务 不考虑性能的话 可以代替  代办查询querytodoList）
	 * @param userId
	 * @param page
	 * @param size
	 * @return
	 */
	List<HistoricTaskInstance> historyTaskList(String userId,List<String> roles,String key,boolean status,int page,int size);
	
	long historyTaskCount(String userId,List<String> roles,String key,boolean status);
	
	/**
	 * 查询 流程实例的 审批历史
	 * @param processInstanceId
	 * @return
	 */
	public  List<HistoricActivityInstance> getHisUserTaskActivityInstanceList(String processInstanceId);
	
}
