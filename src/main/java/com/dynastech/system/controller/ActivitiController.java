package com.dynastech.system.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dynastech.base.util.I18nUtil;
import com.dynastech.system.entity.ProcessDefinitionEntity;

@Controller
@RequestMapping("/system/process")
public class ActivitiController{

	@Autowired
	ProcessEngine engine;
	@Autowired
    private RepositoryService repositoryService;

	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/system/process_index");
		return mv;
	}

	/**
	 * 部署流程
	 */
	@RequestMapping(value="/deploy",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> upload(@RequestParam("file")MultipartFile file,HttpServletRequest request,ModelMap model) throws Exception{
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		if(!file.isEmpty()){
			if(FilenameUtils.getExtension(file.getOriginalFilename()).equals("zip")||FilenameUtils.getExtension(file.getOriginalFilename()).equals("bar")){
				ZipInputStream zip=new ZipInputStream(file.getInputStream());
				//部署
				repositoryService.createDeployment().addZipInputStream(zip).deploy();
			}
		}
		data.put("msg","success");
		
		return data;
	}
	
	/**
	 * 已部署流程列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> list() {
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			RepositoryService service = engine.getRepositoryService();
			 ProcessDefinitionQuery processDefinitionQuery =service.createProcessDefinitionQuery();
			List<ProcessDefinition> list = processDefinitionQuery.list();
			
			List<ProcessDefinitionEntity> list2= new ArrayList<>();
			
			for(ProcessDefinition pd:list ){
				ProcessDefinitionEntity pde=new ProcessDefinitionEntity();
				pde.setId(pd.getId());
				pde.setThekey(pd.getKey());
				pde.setName(pd.getName());
				pde.setDeploymentId(pd.getDeploymentId());
				pde.setResourceName(pd.getResourceName());
				pde.setDiagramResourceName(pd.getDiagramResourceName());
				pde.setRevision(pd.getResourceName());
				
				list2.add(pde);
			}
			
			data.put("rows", list2);
			data.put("total", processDefinitionQuery.count());
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return data;
		
	}
 
	/**
	 * 流程上传方法
	 */
	@RequestMapping("/add.html")
	public ModelAndView todeploy(ModelAndView mav) {

		mav.setViewName("/system/process_add");
		return mav;
	}

	/**
	 * 启动一个流程实例
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/start")
	public ModelAndView start(String id, ModelAndView mav) {

		RuntimeService service = engine.getRuntimeService();

		service.startProcessInstanceById(id);

		List<ProcessInstance> list = service.createProcessInstanceQuery()
				.list();

		mav.addObject("list", list);
		mav.setViewName("process/started");

		return mav;
	}

	/**
	 * 所有已启动流程实例
	 */
	@RequestMapping("started")
	public ModelAndView started(ModelAndView mav) {

		RuntimeService service = engine.getRuntimeService();

		List<ProcessInstance> list = service.createProcessInstanceQuery()
				.list();

		mav.addObject("list", list);
		mav.setViewName("process/started");

		return mav;
	}
	
	@RequestMapping("task")
	public ModelAndView task(ModelAndView mav){
		TaskService service=engine.getTaskService();
		List<Task> list=service.createTaskQuery().list();
		mav.addObject("list", list);
		mav.setViewName("process/task");
		return mav;
	}
	
	@RequestMapping("complete")
	public ModelAndView complete(ModelAndView mav,String id){
		
		TaskService service=engine.getTaskService();
		
		service.complete(id);
		
		return new ModelAndView("redirect:task");
	}
	
    /*
     * 查看流程图
     * */
	@RequestMapping("/lookprocessdefine")
	public void loadResourceByDeployment(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String deploymentId=request.getParameter("deploymentId");
		String resourceName=request.getParameter("resourceName");
		InputStream is=repositoryService.getResourceAsStream(deploymentId, resourceName);
		byte [] data=IOUtils.toByteArray(is);
		ServletOutputStream os=(ServletOutputStream)response.getOutputStream();
		os.write(data, 0, data.length);
		os.flush();
		os.close();
	}
	
	@RequestMapping("/delete")
	public @ResponseBody Map<String, Object> delete(String deploymentId) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		
		repositoryService.deleteDeployment(deploymentId);
		
		data.put("message",I18nUtil.getTextValue("dynastech.common.operation.success"));
		
		return data;
	}

}
