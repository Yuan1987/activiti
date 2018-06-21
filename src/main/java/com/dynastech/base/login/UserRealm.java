package com.dynastech.base.login;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.dynastech.base.common.service.ICommonService;
import com.dynastech.system.entity.Resource;
import com.dynastech.system.entity.User;
import com.dynastech.system.service.IResourceManagerService;
import com.dynastech.system.service.IUserManagerService;


/**
 * 支持用户名密码验证
 * 
 * @author yuan
 */
public class UserRealm extends AuthorizingRealm {  
	
	@Autowired
	private IUserManagerService userManagerService;
	
	@Autowired
	private IResourceManagerService resourceManagerService;
	
	@Autowired
	ICommonService commonService;
	
	
    /** 
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法 
     */  
    @Override  
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {  
    	 String username = (String) principals.getPrimaryPrincipal();
         SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
         
         // 根据用户名查询当前用户拥有的角色
         /*Set<Role> roles = userService.findRoles(username);
         Set<String> roleNames = new HashSet<String>();
         for (Role role : roles) {
             roleNames.add(role.getRole());
         }
         // 将角色名称提供给info
         authorizationInfo.setRoles(roleNames);*/
         
         User user=commonService.getCurrentUser();
         
         // 根据用户名查询当前用户权限
         List<Resource> list = resourceManagerService.findResourceByUserId(user.getId(), null);
         Set<String> permissionNames = new HashSet<String>();
         for (Resource re : list) {
             permissionNames.add(re.getPermission());
         }
         // 将权限名称提供给info
         authorizationInfo.setStringPermissions(permissionNames);

         return authorizationInfo; 
    }  
  
    /** 
     * 认证回调函数，登录信息和用户验证信息验证 
     */  
    @Override  
    protected AuthenticationInfo doGetAuthenticationInfo(  
            AuthenticationToken authcToken) throws AuthenticationException{
    	
        String username = (String)authcToken.getPrincipal();
        
        User user = userManagerService.selectByUserName(username);
    	if (user == null) {
			throw new UnknownAccountException();//没找到帐号
		}
    	//第二个参数应为password 目前没有
        return new SimpleAuthenticationInfo(username,user.getAccountname(), getName());  
    }  
  
}  