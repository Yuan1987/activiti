package com.dynastech.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dynastech.system.entity.OrganizationUser;
import com.dynastech.system.entity.OrganizationUserExample;
import com.dynastech.system.entity.RoleUser;
import com.dynastech.system.entity.RoleUserExample;
import com.dynastech.system.entity.User;
import com.dynastech.system.entity.UserExample;
import com.dynastech.system.mapper.OrganizationUserMapper;
import com.dynastech.system.mapper.RoleUserMapper;
import com.dynastech.system.mapper.UserMapper;
import com.dynastech.system.service.IUserManagerService;

@Service
public class UserManagerService implements IUserManagerService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private OrganizationUserMapper ouMapper;
	
	@Autowired
	private RoleUserMapper ruMapper;
	
	@Override
	public List<User> selectUserByOrgId(String orgId,String searchText) {
		
		return userMapper.selectUsersByOrgId(orgId,searchText);
	}
	
	@Override
	@Transactional
	public int add(User user, String[] roleIds, String[]orgIds) {
		
		int i=userMapper.insertSelective(user);
		
		OrganizationUser ou=new OrganizationUser();
		for(String orgId:orgIds){
			ou.setUserid(user.getId());
			ou.setOrganizationid(orgId);
			ou.setOrdinal(0);
			ouMapper.insertSelective(ou);
		}
		
		RoleUser ru=new RoleUser();
		for(String roleId:roleIds){
			ru.setRoleid(roleId);
			ru.setUserid(user.getId());
			ru.setOrdinal(0);
			ruMapper.insertSelective(ru);
		}
		return i;
	}
	
	@Override
	@Transactional
	public int update(User user, String[] roleIds, String[]orgIds) {
		
		int i=userMapper.updateByPrimaryKeySelective(user);
		
		//删除人员对应的组织信息 并新增 新的组织信息
		OrganizationUserExample oue=new OrganizationUserExample();
		oue.createCriteria().andUseridEqualTo(user.getId());
		ouMapper.deleteByExample(oue);
		OrganizationUser ou=new OrganizationUser();
		for(String orgId:orgIds){
			ou.setUserid(user.getId());
			ou.setOrganizationid(orgId);
			ou.setOrdinal(0);
			ouMapper.insertSelective(ou);
		}
		//删除人员对应的角色信息 并新增 新的角色信息
		RoleUserExample rue=new RoleUserExample();
		rue.createCriteria().andUseridEqualTo(user.getId());
		ruMapper.deleteByExample(rue);
		RoleUser ru=new RoleUser();
		for(String roleId:roleIds){
			ru.setRoleid(roleId);
			ru.setUserid(user.getId());
			ru.setOrdinal(0);
			ruMapper.insertSelective(ru);
		}
		return i;
	}
	
	@Override
	public List<User> selectByExample(UserExample ue) {
		return userMapper.selectByExample(ue);
	}
	
	@Override
	public User selectByUserName(String userName) {
		
		UserExample ue=new UserExample();
		ue.createCriteria().andIsdeletedEqualTo(false).andAccountnameEqualTo(userName);
		
		List<User> list=this.selectByExample(ue);
		
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public User selectById(String id) {
		return userMapper.selectByPrimaryKey(id);
	}
	
	@Override
	@Transactional
	public int delete(String id) {
		
		User user=new User();
		user.setId(id);
		user.setIsdeleted(true);
		int i=userMapper.updateByPrimaryKeySelective(user);
		
		//删除本组织下的 人员关系数据 暂定义为全部清除而非只清除某个部门的
		OrganizationUserExample oue=new OrganizationUserExample();
		oue.createCriteria().andUseridEqualTo(id);
		ouMapper.deleteByExample(oue);
		return i;
	}
	
	@Override
	public List<User> findLeadersByOrgId(List<String> orgId) {
		
		return userMapper.findLeadersByOrgId(orgId);
	}
	
	@Override
	public List<User> findUsersByRoleName(String roleName) {
		return userMapper.findUsersByRoleName(roleName);
	}
}
