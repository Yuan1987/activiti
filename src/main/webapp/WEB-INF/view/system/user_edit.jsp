<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/static/assets/global/plugins/select2/css/select2.min.css" type="text/css">
<link rel="stylesheet" href="${ctx}/static/assets/global/plugins/select2/css/select2-bootstrap.min.css"type="text/css" />
<script>
	var orgIds='${orgIds}';
</script>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header padding-sty">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3 id="userModelTitle">人员账号修改</h3>
		</div>
		<form id="userForm" class="form-horizontal" method="POST">
			<input type="hidden" id="userId" name="id" value="${user.id}" />
			<div class="form-group margin-top-10">
				<label class="col-sm-2 control-label">*所属组织</label>
				<div class="col-sm-8">
					<select class="selec2" name="orgIds" id="orgIds"
						multiple="multiple">
						<c:forEach items="${orgs}" var="org">
							<option value="${org.id}">${org.displayname}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">*账号</label>
				<div class="col-sm-8">
					<input type="text" id="accountname" name="accountname" value="${user.accountname}"
						class="form-control" placeholder="账号" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">*角色</label>
				<div class="col-sm-8">
					<select class="select2" id="role" name="roleIds" multiple="multiple">
						<c:forEach items="${roleList}" var="role">
							<option value="${role.id}" selected="selected">${role.displayname}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">*全称</label>
				<div class="col-sm-8">
					<input type="text" id="username" name="name" class="form-control" value="${user.name}"
						placeholder="名称" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">*显示名称</label>
				<div class="col-sm-8">
					<input type="text" id="userdisplayname" name="displayname" value="${user.displayname}"
						class="form-control" placeholder="显示名称" required="required">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">确认</button>
				<a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${ctx}/static/system/user_edit.js"></script>