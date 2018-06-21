
package com.dynastech.model.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang.StringUtils;
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
import com.dynastech.base.global.Constants;
import com.dynastech.base.log.LogType;
import com.dynastech.base.util.I18nUtil;
import com.dynastech.base.util.LogUtil;
import com.dynastech.common.service.IDictionaryService;
import com.dynastech.model.entity.Apply;
import com.dynastech.model.entity.ModelEnum;
import com.dynastech.model.entity.ApplyExample;
import com.dynastech.model.entity.ApplyExample.Criteria;
import com.dynastech.model.service.IApplyService;
import com.dynastech.system.entity.Organization;
import com.dynastech.system.entity.Role;
import com.dynastech.system.entity.User;
import com.dynastech.system.service.IActivitiService;
import com.dynastech.system.service.IOrgManagerService;
import com.dynastech.system.service.IRoleManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 我的申请
 * 
 * @author yuanhb
 *
 */
@Controller
@RequestMapping("/model/apply")
public class ApplyController {

	private static Logger logger = Logger.getLogger(ApplyController.class);

	@Autowired
	private IApplyService applyService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private IRoleManagerService roleManagerService;
	
	@Autowired
	IOrgManagerService orgManagerService;
	
	@Autowired
	private IDictionaryService dicService;
	
	@Autowired
	IActivitiService activitiService;
	
	
	@RequiresPermissions("apply:view")
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/model/apply_index");
		return mv;
	}
	
	@RequiresPermissions("apply:view")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> list(HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "size", defaultValue = "20", required = false) int size,
			String status) {

		PageHelper.startPage(page, size);
		PageHelper.orderBy("a.datetimecreated desc");
		Map<String, Object> data = new HashMap<String, Object>();
		
		User user=commonService.getCurrentUser();
		
		ApplyExample  ae=new ApplyExample();
		Criteria c= ae.createCriteria();
		
		c.andUseridEqualTo(user.getId()).andIsdeletedEqualTo(false);
		
		if(!StringUtils.isBlank(status)){
			c.andStatusEqualTo(status);
		}
		
		List<Apply> datas = applyService.selectByExample(ae);
		// 取分页信息
        PageInfo<Apply> pageInfo = new PageInfo<Apply>(datas);
		data.put("rows", datas);
		data.put("total", pageInfo.getTotal());

		return data;
	}
	
	

	@RequiresPermissions("apply:add")
	@RequestMapping("/add.html")
	public ModelAndView add(String orgId) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("user", commonService.getCurrentUser());
		mv.addObject("sqlxList",dicService.findByKind(Constants.DIC_KIND_SQLX));
		mv.addObject("jbList",dicService.findByKind(Constants.DIC_KIND_SBJB));
		mv.addObject("xlList",dicService.findByKind(Constants.DIC_KIND_SBXL));
		
		mv.setViewName("/model/apply_add");
		return mv;
	}
	
	@RequiresPermissions("apply:add")
	@RequestMapping("/add")
	public @ResponseBody Map<String, Object> add(Apply obj,String havequalificationgradeTime2) {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			obj.setId(UUID.randomUUID().toString());
			
			Date now=new Date();
			
			obj.setDatetimecreated(now);
			obj.setDatetimemodified(now);
			
			if("04".equals(obj.getType())){//复核
				obj.setHavequalificationgradeTime(havequalificationgradeTime2);
			}
			
			int a = applyService.add(obj);
			data.put("message", a > 0 ? I18nUtil.getTextValue("dynastech.common.operation.success"):I18nUtil.getTextValue("dynastech.common.operation.fail"));
			
			LogUtil.addLog(logger, LogType.APPLY_ADD.getValue(), obj.getId(), commonService.getCurrentUser());
			
		} catch (Exception e) {
			data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
			logger.error("ApplyController.add", e);
		}
		return data;
	}
	
	@RequiresPermissions("apply:commit")
	@RequestMapping("/commit.html")
	public ModelAndView commit(String ids) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("ids", ids);
		mv.setViewName("/model/apply_commit");
		return mv;
	}
	
	@RequiresPermissions("apply:commit")
	@RequestMapping("/commit")
	public @ResponseBody Map<String, Object> doCommit(String id,String leaderId) {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			
			User user=commonService.getCurrentUser();
			
			List<Organization> orgs=user.getOrgs();
			
			List<String> orgIds= new Vector<String>();
			
			for(Organization org:orgs){
				orgIds.add(org.getId());
			}
			
			//查询该部门领导角色
			List<Role> roles=roleManagerService.selectRoleByOrgIds(orgIds,ModelEnum.LEADER_ROLE_ID.getValue());
			if(roles.size()<1){
				data.put("message","未找到该部门的领导角色");
				return data;
			}
			List<String> roleList=new ArrayList<String>();
			
			for(Role role:roles){
				roleList.add(role.getId());
			}
			//启动流程
			Map<String,Object> map=new HashMap<>();
			map.put("userRole",roleList);
			ProcessInstance processins=activitiService.startProcess(user.getId(),"test", id, map);
			
			Apply app=new Apply();
			app.setId(id);
			app.setProcessid( processins.getId());
			app.setSubmittime(new Date());
			app.setStatus(ModelEnum.STATUS_1.getValue());
			
			int a=applyService.update(app);
			
			data.put("message", a > 0 ? I18nUtil.getTextValue("dynastech.common.operation.success"):I18nUtil.getTextValue("dynastech.common.operation.fail"));
			
			LogUtil.addLog(logger, LogType.APPLY_COMMIT.getValue(), id, user);
			
		} catch (Exception e) {
			data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
			logger.error("ApplyController.commit", e);
		}
		return data;
	}
	
	@RequiresPermissions("apply:delete")
	@RequestMapping("/delete")
	public @ResponseBody Map<String, Object> delete(String ids) {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			
			User user=commonService.getCurrentUser();
			
			ApplyExample ae=new ApplyExample();
			
			ae.createCriteria().andIdEqualTo(ids).andStatusEqualTo(ModelEnum.STATUS_0.getValue())
			.andUseridEqualTo(user.getId());
			Apply apply=new Apply();
			apply.setId(ids);
			apply.setIsdeleted(true);
			int a = applyService.update(ae,apply);
			
			data.put("message", a > 0 ? I18nUtil.getTextValue("dynastech.common.operation.success"):I18nUtil.getTextValue("dynastech.common.operation.fail"));
		} catch (Exception e) {
			data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
			logger.error("ApplyController.delete", e);
		}
		return data;
	}
	
	@RequiresPermissions("apply:edit")
	@RequestMapping("/edit.html")
	public ModelAndView edit(String id) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("user", commonService.getCurrentUser());
		mv.addObject("sqlxList",dicService.findByKind(Constants.DIC_KIND_SQLX));
		mv.addObject("jbList",dicService.findByKind(Constants.DIC_KIND_SBJB));
		mv.addObject("xlList",dicService.findByKind(Constants.DIC_KIND_SBXL));
		mv.addObject("apply",applyService.findById(id));
		
		mv.setViewName("/model/apply_edit");
		return mv;
	}
	
	
	@RequiresPermissions("apply:edit")
	@RequestMapping("/edit")
	public @ResponseBody Map<String, Object> update(Apply apply,String havequalificationgradeTime2) {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			
			if("04".equals(apply.getType())){//复核
				apply.setHavequalificationgradeTime(havequalificationgradeTime2);
			}
			
			int a = applyService.update(apply);
			data.put("message", a > 0 ? I18nUtil.getTextValue("dynastech.common.operation.success"):I18nUtil.getTextValue("dynastech.common.operation.fail"));

		} catch (Exception e) {
			data.put("message", I18nUtil.getTextValue("dynastech.common.operation.fail"));
			logger.error("ApplyController.edit", e);
		}
		return data;
	}
	
	@RequestMapping("/checkDetail.html")
	public ModelAndView checkDetail(String id,String processId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("id",id);
		mv.addObject("processId",processId);
		mv.setViewName("/model/apply_checkDetail");
		return mv;
	}
}
