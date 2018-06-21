package com.dynastech.model.service;

import java.util.List;
import java.util.Map;

import com.dynastech.model.entity.Apply;
import com.dynastech.model.entity.ApplyExample;
import com.dynastech.model.entity.ApplyWithEval;
import com.dynastech.model.entity.CheckDetail;

public interface IApplyService {
	
	/**
	 * @param example
	 * @return
	 */
	public List<Apply> selectByExample(ApplyExample example);
	
	/**
	 * @param id
	 * @return
	 */
	public Apply findById(String id);
	
	/**
	 * 新增
	 * @param apply
	 * @return
	 */
	public int add(Apply apply);
	
	/**
	 * 修改
	 * @param apply
	 * @return
	 */
	public int update(Apply apply);
	
	/**
	 * 根据条件更新
	 * @param example
	 * @return
	 */
	public int update (ApplyExample example,Apply apply);
	
	
	/**
	 * 审核
	 * @param cd
	 * @return
	 */
	public Map<String, Object>  check(CheckDetail cd);
	
	/**
	 * 查询审批记录
	 * @param id
	 * @return
	 */
	public List<CheckDetail> selectDetailsById(String id);
	
	/**
	 * 通过用户ID 和申请的审核状态 来查询 申请和对应的评测表
	 * @param userId
	 * @param status
	 * @return
	 */
	public List<ApplyWithEval> selectApplyWithEval(String userId,String status); 
	
	/**
	 * 通过测评表Id 查询 申请和对应的评测表
	 * @param userId
	 * @param status
	 * @return
	 */
	public ApplyWithEval selectApplyWithEvalByEFId(String efId);
}
