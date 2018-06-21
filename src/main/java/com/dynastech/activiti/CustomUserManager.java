package com.dynastech.activiti;

import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.UserQueryImpl;
import org.activiti.engine.impl.persistence.entity.IdentityInfoEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserEntityManager;
import org.springframework.beans.factory.annotation.Autowired;

import com.dynastech.system.service.IUserManagerService;

/**
 * 自定义的Activiti用户管理器
 * @author yuanhb
 *
 */
public class CustomUserManager extends UserEntityManager {
	
	@Autowired
	IUserManagerService userManagerService;
	
	  
    @Override  
    public User createNewUser(String userId) {  
        return super.createNewUser(userId);  
    }  
  
    @Override  
    public void insertUser(User user) {  
        super.insertUser(user);  
    }  
    @Override
    public void updateUser(User updatedUser) {
    	super.updateUser(updatedUser);
    };
  
    @Override
    public User findUserById(String userId) {
    	
    	com.dynastech.system.entity.User user=userManagerService.selectById(userId);
    	
    	UserEntity ue=new UserEntity();
    	
    	ue.setId(user.getId());
    	
    	return ue;
    }
  
    @Override  
    public void deleteUser(String userId) {  
        super.deleteUser(userId);  
    }  
  
    @Override  
    public List<User> findUserByQueryCriteria(UserQueryImpl query, Page page) {  
        return super.findUserByQueryCriteria(query, page);  
    }  
  
    @Override  
    public long findUserCountByQueryCriteria(UserQueryImpl query) {  
        return super.findUserCountByQueryCriteria(query);  
    }  
  
    @Override  
    public List<Group> findGroupsByUser(String userId) {  
        return super.findGroupsByUser(userId);  
    }  
  
    @Override  
    public UserQuery createNewUserQuery() {  
        return super.createNewUserQuery();  
    }  
  
    @Override  
    public IdentityInfoEntity findUserInfoByUserIdAndKey(String userId, String key) {  
        return super.findUserInfoByUserIdAndKey(userId, key);  
    }  
  
    @Override  
    public List<String> findUserInfoKeysByUserIdAndType(String userId, String type) {  
        return super.findUserInfoKeysByUserIdAndType(userId, type);  
    }  
  
    @Override  
    public Boolean checkPassword(String userId, String password) {  
        return super.checkPassword(userId, password);  
    }  
  
    @Override  
    public List<User> findPotentialStarterUsers(String proceDefId) {  
        return super.findPotentialStarterUsers(proceDefId);  
    }  
  
    @Override  
    public List<User> findUsersByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {  
        return super.findUsersByNativeQuery(parameterMap, firstResult, maxResults);  
    }  
  
    @Override  
    public long findUserCountByNativeQuery(Map<String, Object> parameterMap) {  
        return super.findUserCountByNativeQuery(parameterMap);  
    }  
  
}  