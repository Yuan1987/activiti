<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<link rel="stylesheet" href="${ctx}/static/assets/global/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="page-content-wrapper">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<!-- BEGIN PAGE HEAD-->
		<ul class="page-breadcrumb breadcrumb">
			<li><a href="#">组织机构</a> <i class="fa fa-circle"></i></li>
			<li><span class="active">角色管理</span></li>
		</ul>
		<!-- END PAGE BREADCRUMB -->
		<!-- BEGIN PAGE BASE CONTENT -->
		<div class="row">
			<div class="form-horizontal" role="form">
				<div class="row">
					<div class="col-md-4">
						<div class="fixed-table-toolbar" id="itemFileEditDivMenu">
							<div class="bs-bars pull-left">
								<shiro:hasPermission name="org:add">
									<button id="itemFileMenuAdd" class="btn btn-sm">
										<i class="fa fa-plus"></i> 新增
									</button>
								</shiro:hasPermission>
								<shiro:hasPermission name="org:update">
									<button id="itemFileMenuEdit" class="btn btn-sm">
										<i class="fa fa-edit"></i> 修改
									</button>
								</shiro:hasPermission>
								<shiro:hasPermission name="org:delete">
									<button id="itemFileMenuDelb" class="btn btn-sm btn-danger">
										<i class="glyphicon glyphicon-remove"></i> 删除
									</button>
								</shiro:hasPermission>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">组织机构</h3>
							</div>
							<div class="panel-body" id="itemFileTypeTree">
								<ul id="treeDemo" class="ztree"></ul>
							</div>
						</div>
					</div>

					<div class="col-md-8" id="itemFileRightDiv">
						<div class="m-top-up-15">
							<div class="fixed-table-toolbar">
								<div class="bs-bars pull-left">
									<div id="toolbar">
										<shiro:hasPermission name="role:add">
											<button id="add" class="btn btn-sm">
												<i class="fa fa-plus"></i> 新增
											</button>
										</shiro:hasPermission>
									</div>
								</div>
							</div>
							<table id="roleTable" class="table"
								data-side-pagination="server" data-pagination="true"
								data-row-style="rowStyle" data-side-pagination="server"
				  				data-page-list="[10,15, 20, 50, 100, 200]"
								data-search="true" data-show-refresh="true" data-show-toggle="true"
								data-search-on-enter-key="true"
								data-show-columns="true">
								<thead>
									<tr>
										<th data-checkbox="true"></th>
										<th data-field="displayname" data-halign="center"
											data-align="center">角色名称</th>
										<th data-field="organizationName" data-halign="center"
											data-align="center">所属组织</th>
										<th data-formatter="org.operation" data-align="center">操作</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="orgModal" tabindex="-1" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header padding-sty">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3 id="modelTitle"></h3>
			</div>
			
			<form id="orgForm" class="form-horizontal" method="POST">
				<input type="hidden" id="orgId" name="id" />
				<div class="form-group margin-top-10">
					<label class="col-sm-2 control-label">*上级名称</label>
					<div class="col-sm-8">
						<input type="hidden" id="parentid" name="parentid" readonly="readonly" >
						<input type="text" id="parentname" name="parentname" class="form-control" readonly="readonly">
						<input type="hidden" id="path" name="path"  readonly="readonly">
						<input type="hidden" id="depth" name="depth"  readonly="readonly">
						<input type="hidden" id="typeid" name="typeid"  readonly="readonly">
						<input type="hidden" id="pobj" name="pobj"  readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*全称</label>
					<div class="col-sm-8">
						<input type="text" id="name" name="name"
							class="form-control" placeholder="名称"  required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*显示名称</label>
					<div class="col-sm-8">
						<input type="text" id="displayname" name="displayname"
							class="form-control" placeholder="显示名称"  required="required">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">确认</button>
					<a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="roleModal" tabindex="-1" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header padding-sty">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3 id="roleModelTitle"></h3>
			</div>
			
			<form id="roleForm" class="form-horizontal" method="POST">
				<input type="hidden" id="roleId" name="id" />
				<div class="form-group margin-top-10">
					<label class="col-sm-2 control-label">*所属组织</label>
					<div class="col-sm-8">
						<input type="hidden" id="organizationid" name="organizationid" readonly="readonly" >
						<input type="text" id="orgName" name="orgName" class="form-control" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*名称</label>
					<div class="col-sm-8">
						<input type="text" id="rolename" name="name"
							class="form-control" placeholder="名称"  required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*显示名称</label>
					<div class="col-sm-8">
						<input type="text" id="roledisplayname" name="displayname"
							class="form-control" placeholder="显示名称"  required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*角色类型</label>
					<div class="col-sm-8">
						<select name="typeid" class="form-control" id="roletypeid">
							<c:forEach items="${roleType}" var="t">
								<option value="${t.id}">${t.displayname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*拥有权限</label>
					<div class="col-sm-8">
						 <jsp:include page="../common/resources.jsp"></jsp:include>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">描述</label>
					<div class="col-sm-8">
						<input type="text" id="description" name="description"
							class="form-control" placeholder="角色描述">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">确认</button>
					<a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="${ctx}/static/assets/global/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/static/assets/global/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${ctx}/static/assets/global/plugins/ztree/js/jquery.ztree.exedit.js"></script>

<script src="${ctx}/static/common/baseTree.js"></script>
<script src="${ctx}/static/system/org.js"></script>
<script src="${ctx}/static/system/role.js"></script>
<script>
	var rootPath = '${ctx}';
</script>
