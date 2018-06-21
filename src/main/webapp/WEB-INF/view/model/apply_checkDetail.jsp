<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header padding-sty">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3 id="modelTitle">审核状态</h3>
		</div>
		<div class="portlet light">
			<div class="row" style="text-align: center;">
				<img src="${ctx}/model/check/lookprocessdefine?processId=${processId}" />
			</div>
			<table id="applyCheckDetailTable" class="table" >
				<thead>
					<tr>
						<th data-checkbox="true"></th>
						<th data-field="nodename" data-align="center">环节名称</th>
						<th data-field="createdtime" data-align="center">审核时间</th>
						<th data-field="username" data-align="center">审核人</th>
						<th data-field="result" data-align="center" data-formatter="resultDecode">审核结果</th>
						<th data-field="opinion">审核意见</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>

<script>
$(function() {

	var id="${id}";
	var processId="{processId}";
	
	$('#applyCheckDetailTable').bootstrapTable({
		method : 'POST',
		contentType : "application/x-www-form-urlencoded",
		queryParamsType : 'pageSize',
		queryParams : function(params) {
			return {
			};
		},
		url : rootPath + "/model/check/applyCheckDetail?applyId="+id,
		cache : false,
		searchOnEnterKey:true,
		sidePagination : 'server',
		onLoadSuccess : function() {}
	});
})

function resultDecode(val){
	var value=val==true?'通过':'不通过';
	
	return value;
}
</script>