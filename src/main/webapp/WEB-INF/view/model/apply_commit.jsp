<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header padding-sty">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3 id="modelTitle">申请提交</h3>
		</div>
		<form id="applyForm" class="form-horizontal" method="get" action="#">
			<div class="portlet light bordered">
				<div class="form-group">
					<label class="col-sm-2 control-label">*审核人</label>
					<div class="col-sm-8">
						<select name="leaderId" class="form-control">
							<c:forEach items="${users}" var="user">
								<option value="${user.id}">${user.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<input type="text" name="id" value="${ids}">
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">保存</button>
					<a href="javascript:modalHide();" class="btn btn-default"
						data-dismiss="modal">取消</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">

$(function() {
	
	$.fn.modal.Constructor.prototype.enforceFocus = function () {};
	$("select").select2({
		language : "zh-CN",
		placeholder : "请选择",
		width:"100%"
	});

	bootstrapValidator = $('#applyForm').bootstrapValidator({
		excluded : [ ':disabled' ],
		fields : {
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		$.ajax({
			dataType : "json",
			url : rootPath + "/model/apply/commit",
			type : "post",
			data : $("#applyForm").serialize(),
			success : function(data) {
				if (data.message == "操作成功！") {
					$("#applyTable").bootstrapTable('refresh');
					$("#theModal").modal("hide");
				}
				layer.alert(data.message, {
					title : '提示',
					icon : 0,
					skin : 'layer-ext-moon'
				});
			},
			error : function() {
				layer.alert(data.message, {
					title : '提示',
					icon : 2,
					skin : 'layer-ext-moon'
				});
			}
		});
	});
});

</script>

