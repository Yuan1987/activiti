package com.dynastech.activiti;

import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.GroupQuery;
import org.activiti.engine.impl.GroupQueryImpl;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.persistence.entity.GroupEntityManager;

/** 
 * 自定义的Activiti用户组管理器 
 * @author yuanhb
 */
public class CustomGroupManager extends GroupEntityManager {  
    @Override  
    public Group createNewGroup(String groupId) {  
        return super.createNewGroup(groupId);  
    }  
  
    @Override  
    public void insertGroup(Group group) {  
        super.insertGroup(group);  
    }  
  
   @Override
   public void updateGroup(Group updatedGroup) {
	   super.updateGroup(updatedGroup);
   };
  
    @Override  
    public void deleteGroup(String groupId) {  
        super.deleteGroup(groupId);  
    }  
  
    @Override  
    public GroupQuery createNewGroupQuery() {  
        return super.createNewGroupQuery();  
    }  
  
    @Override  
    public List<Group> findGroupByQueryCriteria(GroupQueryImpl query, Page page) {  
        return super.findGroupByQueryCriteria(query, page);  
    }  
  
    @Override  
    public long findGroupCountByQueryCriteria(GroupQueryImpl query) {  
        return super.findGroupCountByQueryCriteria(query);  
    }  
  
    @Override  
    public List<Group> findGroupsByUser(String userId) {  
        return super.findGroupsByUser(userId);  
    }  
  
    @Override  
    public List<Group> findGroupsByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {  
        return super.findGroupsByNativeQuery(parameterMap, firstResult, maxResults);  
    }  
  
    @Override  
    public long findGroupCountByNativeQuery(Map<String, Object> parameterMap) {  
        return super.findGroupCountByNativeQuery(parameterMap);  
    }  
}  
