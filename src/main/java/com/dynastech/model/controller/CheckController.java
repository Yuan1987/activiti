
package com.dynastech.model.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.image.ProcessDiagramGenerator;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dynastech.base.common.service.impl.CommonService;
import com.dynastech.base.util.I18nUtil;
import com.dynastech.model.entity.Apply;
import com.dynastech.model.entity.ModelEnum;
import com.dynastech.model.entity.CheckDetail;
import com.dynastech.model.service.IApplyService;
import com.dynastech.system.entity.Role;
import com.dynastech.system.entity.User;
import com.dynastech.system.service.IActivitiService;
import com.dynastech.system.service.IOrgManagerService;
import com.dynastech.system.service.IRoleManagerService;

/**
 * 待我审批 （申报表）
 * 
 * @author yuanhb
 *
 */
@Controller
@RequestMapping("/model/check")
public class CheckController {

	private static Logger logger = Logger.getLogger(CheckController.class);
	
	private static String flowKey="test";

	@Autowired
	private IApplyService applyService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	IOrgManagerService orgManagerService;
	
	@Autowired
	private IActivitiService activitiService;
	
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private IRoleManagerService roleManagerService;
	
	@Autowired
	private RepositoryService repositoryService;
	
	@Autowired
	private ProcessEngine processEngine;
	
	
	@RequiresPermissions("check:view")
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/model/check_index");
		return mv;
	}
	
	@RequiresPermissions("check:view")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> list(HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "size", defaultValue = "15", required = false) int size,
			@RequestParam(value="status",defaultValue="0")boolean status) {

		Map<String, Object> data = new HashMap<String, Object>();
		
		User user=commonService.getCurrentUser();
		
		String userId=user.getId();
		
		List<Apply> list=new Vector<Apply>();
		
		List<String> roleIds=new ArrayList<String>();
		
		List <Role> roles=roleManagerService.selectRolesByUserId(userId);
		
		for(Role role:roles){
			roleIds.add(role.getId());
		}
		long count=activitiService.historyTaskCount(userId,roleIds,flowKey, status);
		
		if(!status){//待办
			List<Task> taskList = activitiService.querytodoListByRole(roleIds,flowKey,page,size);
			for(Task task:taskList){
				String processinsId=task.getProcessInstanceId();
				ProcessInstance pi=runtimeService.createProcessInstanceQuery().processInstanceId(processinsId).singleResult();
				String businesskey=pi.getBusinessKey();
				Apply  apply=applyService.findById(businesskey);
				apply.setTaskId(task.getId());
				apply.setTaskName(task.getName());
				apply.setComplete(false);
				list.add(apply);
			}
			count=activitiService.querytodoCountByRole(roleIds,flowKey);
		}else{//已办 
			//如果 暂不考虑性能 或 待办已办 一并查询 可以用此方法代替 上面的待办查询
			List<HistoricTaskInstance> taskList=activitiService.historyTaskList(userId,roleIds,flowKey,status,page, size);
			
			for(HistoricTaskInstance hti:taskList){  
				String processinsId=hti.getProcessInstanceId();
				HistoricProcessInstance pi=historyService.createHistoricProcessInstanceQuery().processInstanceId(processinsId).singleResult();
				if(pi!=null){
					String businesskey=pi.getBusinessKey();
					Apply  apply=applyService.findById(businesskey);
					apply.setTaskId(hti.getId());
					apply.setTaskName(hti.getName());
					boolean c=hti.getEndTime()==null?false:true;
					apply.setComplete(c);
					list.add(apply); 
				}
		    } 
		}
		data.put("rows", list);
		data.put("total", count);

		return data;
	}

	@RequiresPermissions("check:view")
	@RequestMapping("/checkApplyInfo.html")
	public ModelAndView checkApplyInfo(String id,String taskId,boolean complete) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/model/checkApplyInfo");
		mv.addObject("detailList",applyService.selectDetailsById(id));
		mv.addObject("apply",applyService.findById(id));
		mv.addObject("taskId", taskId);
		mv.addObject("complete", complete);
		return mv;
	}
	
	@RequiresPermissions("check:view")
	@RequestMapping("/toCheck.html")
	public ModelAndView toCheck(String id,boolean pass,String taskId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/model/check");
		mv.addObject("pass",pass);
		mv.addObject("taskId",taskId);
		mv.addObject("applyId", id);
		
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		String taskName=task.getName();
		if(ModelEnum.flow_NODE1_NAME.getValue().equals(taskName)){//部门领导审批
			mv.addObject("isDEPT",true);
		}
		return mv;
	}

	@RequiresPermissions("check:view")
	@RequestMapping("/check")
	public @ResponseBody Map<String, Object> check(CheckDetail cd) {
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			
			data=applyService.check(cd);

		} catch (Exception e) {
			data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
			logger.error("checkController.check", e);
		}
		return data;
	}
	
	
	@RequestMapping(value = "/applyCheckDetail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> applyCheckDetail(String applyId) {

		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("rows", applyService.selectDetailsById(applyId));

		return data;
	}
	
	/*
     * 查看流程图
     * */
	@RequestMapping("/lookprocessdefine")
	public void loadResourceByDeployment(HttpServletRequest request,HttpServletResponse response,String processId) throws Exception{
		
		List<Task> taskList=taskService.createTaskQuery().processInstanceId(processId).list();
		ProcessDiagramGenerator pdg = processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator();
		InputStream inputStream=null;
		if(!taskList.isEmpty()){
			Task task=taskList.get(0);
			 //流程定义
	        BpmnModel bpmnModel = repositoryService.getBpmnModel(task.getProcessDefinitionId()); 
		     //正在活动节点
	        List<String> activeActivityIds = runtimeService.getActiveActivityIds(task.getExecutionId());
	       //得到图片输出流（这样加可防止生成的流程图片乱码）
	        inputStream= pdg.generateDiagram(bpmnModel, "png", activeActivityIds,new ArrayList<String>(), "宋体","宋体", "宋体", null, 1.0);
		}else{
			String processDefinitionId=historyService.createHistoricProcessInstanceQuery().processInstanceId(processId).singleResult().getProcessDefinitionId();
	        repositoryService.getProcessDiagram(processDefinitionId);
			inputStream= repositoryService.getProcessDiagram(processDefinitionId);
		}
		byte [] data=IOUtils.toByteArray(inputStream);
		ServletOutputStream os=(ServletOutputStream)response.getOutputStream();
		os.write(data, 0, data.length);
		os.flush();
		os.close();
	}
}
