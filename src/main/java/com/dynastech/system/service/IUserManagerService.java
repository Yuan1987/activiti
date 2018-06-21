package com.dynastech.system.service;

import java.util.List;

import com.dynastech.system.entity.User;
import com.dynastech.system.entity.UserExample;


/**
 * @author  yuan
 */
public interface IUserManagerService {
	
	/**
	 * 通过组织机构查询user
	 * @param orgId
	 * @return
	 */
	public List<User>selectUserByOrgId(String orgId,String searchText);
	
	/**
	 * @param user
	 * @param roleIds
	 * @param orgIds
	 * @return
	 */
	public int add(User user,String[] roleIds,String[] orgIds);
	
	/**
	 * @param user
	 * @param roleIds
	 * @param orgIds
	 * @return
	 */
	public int update(User user,String[] roleIds,String[] orgIds);
	
	/**
	 * @param ue
	 * @return
	 */
	public List<User> selectByExample(UserExample ue);
	
	/**
	 * @param userName
	 * @return
	 */
	public User selectByUserName(String userName);
	
	/**
	 * @param id
	 * @return
	 */
	public User selectById(String id);
	
	/**
	 * @param Id
	 * @return
	 */
	public int delete(String Id);
	
	
	/**
	 * @param orgIds
	 * @return
	 */
	public List<User> findLeadersByOrgId(List<String> orgIds);
	
	/**
	 * @param roleName
	 * @return
	 */
	public List<User> findUsersByRoleName(String roleName);
}
