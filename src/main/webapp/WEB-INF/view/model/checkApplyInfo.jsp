<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="modal-dialog modal-full">
	<div class="modal-content">
		<div class="modal-header padding-sty">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<c:if test="${complete==false}">
				<button type="button" class="btn" id="tg" onclick="applyCheck.check('${apply.id}','true','${taskId}')" disabled="disabled">通过</button>
				<button type="button" class="btn" onclick="applyCheck.check('${apply.id}','false','${taskId}')">不通过</button>
			</c:if>
		</div>
		<div class="col-sm-8" style="height: 400px;">
			<form class="form-horizontal" method="POST"
				style="height: 400px;overflow-y:scroll;overflow-x: hidden;">
				<h4 class="form-section">
					申请表信息 <i class="fa fa-print" onclick="modalShow('print');"
						style="cursor: pointer;"></i>
				</h4>
				<div class="form-group">
					<label class="col-sm-2 control-label">*姓名</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" readonly
							name="username" value="${apply.username}" readonly="readonly">
						<input type="hidden" name="userid" value="${apply.userid}">
					</div>
					<!-- <label class="col-sm-2 control-label">所在部门</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" 
							readonly>
					</div> -->
					<label class="col-sm-2 control-label">*申报序列</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" value="${apply.seqV}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">*申报级别</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" value="${apply.gradeV}" readonly="readonly">
					</div>
					<label class="col-sm-2 control-label">*申请类型</label>
					<div class="col-sm-4">
						<input type="hidden" value="${apply.type}" id="authType">
						<input type="text" class="form-control" value="${apply.typeV}" readonly="readonly">
					</div>
				</div>
				<h4 class="form-section">现职状况</h4>
				<div class="form-group">
					<label class="col-sm-2 control-label">岗位职种</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="jobstype"
							readonly value="${apply.jobstype}">
					</div>
					<label class="col-sm-2 control-label">岗位层级</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="jobsgrade"
							readonly value="${apply.jobsgrade}">
					</div>
				</div>
				<div id="fpg">
					<div class="form-group">
						<label class="col-sm-2 control-label">已具备资格序列</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								name="havequalificationseq" readonly
								value="${apply.havequalificationseq}">
						</div>
						<label class="col-sm-2 control-label">已具备资格级别</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								name="havequalificationgrade" readonly
								value="${apply.havequalificationgrade}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">资格取得时间</label>
						<div class="col-sm-4"> 
							<input type="text" class="form-control"
								name="havequalificationgradeTime" readonly
								value="${apply.havequalificationgradeTime}">
						</div>
						<label class="col-sm-2 control-label">已补充条件序列</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="workconditionsseq" readonly
								value="${apply.workconditionsseq}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">已补充条件层级</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								name="workconditionsgrade" readonly value="${apply.workconditionsgrade}">
						</div>
						<label class="col-sm-2 control-label">补充年度</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								name="workconditionsgradeAnnual" readonly
								value="${apply.workconditionsgradeAnnual}">
						</div>
					</div>
					<h4 class="form-section">学历</h4>
					<div class="form-group">
						<label class="col-sm-2 control-label">毕业院校</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="graduateschool" readonly
								value="${apply.graduateschool}">
						</div>
						<label class="col-sm-2 control-label">所学专业</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="majors" readonly
								value="${apply.majors}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">学历</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly  name="educational" value="${apply.educational}">
						</div>
						<label class="col-sm-2 control-label">学位</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="degree" readonly
								value="${apply.degree}">
						</div>
					</div>
					<h4 class="form-section">经历</h4>
					<div class="form-group">
						<label class="col-sm-2 control-label">经历简诉</label>
						<div class="col-sm-10">
							<textarea rows="5"
								name="experience" class="form-control" readonly>${apply.experience}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">社会标准满足情况</label>
						<div class="col-sm-10">
							<textarea rows="5"
								name="standardsmatching" class="form-control" readonly>${apply.experience}</textarea>
						</div>
					</div>
				</div>

				<div id="fh" style="display: none;">
					<div class="form-group">
						<label class="col-sm-2 control-label">资格取得时间</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								name="havequalificationgradeTime2"
								value="${apply.havequalificationgradeTime}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">取得资格时间后年度考核结果是否有优秀或排序靠前</label>
						<div class="col-sm-2">
							<div class="input-group">
								<div class="icheck-inline">
									<label> <input type="radio" name="nuclearresultsfront"
										<c:if test="${apply.nuclearresultsfront}">checked</c:if>
										class="icheck" readonly="readonly">是
									</label> <label> <input type="radio" name="nuclearresultsfront"
										<c:if test="${apply.nuclearresultsfront}">checked</c:if>
										class="icheck">否
									</label>
								</div>
							</div>
						</div>
						<label class="col-sm-2 control-label">年度</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								name="nuclearresultsfrontAnnual"
								value="${apply.nuclearresultsfrontAnnual}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">改进计划是否闭环 </label>
						<div class="col-sm-4">
							<div class="input-group">
								<div class="icheck-inline">
									<label> <input type="radio"
										name="improvementplanclosedloop"
										<c:if test="${apply.improvementplanclosedloop}">checked</c:if>
										class="icheck">是
									</label> <label> <input type="radio"
										name="improvementplanclosedloop"
										<c:if test="${apply.improvementplanclosedloop}">checked</c:if>
										class="icheck">否
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="pg" style="display: none;">
					<h4 class="form-section">破格原因</h4>
					<div class="form-group">
						<label class="col-sm-2 control-label">不满足的任职资格申请条件</label>
						<div class="col-sm-10">
							<textarea rows="3" name="unqualifiedqualifications"
								readonly class="form-control">${apply.unqualifiedqualifications}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">破格原因</label>
						<div class="col-sm-10">
							<textarea rows="3" name="abnormalityreasons"
								readonly
								class="form-control">${apply.abnormalityreasons}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">申报任职资格级别典型能力满足情况</label>
						<div class="col-sm-10">
							<textarea rows="4" readonly
								name="qualificationmatching" class="form-control">${apply.qualificationmatching}</textarea>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-4" style="height: 400px;">
			<h4 class="form-section">
				审核过程（<a href='${ctx}/model/check/lookprocessdefine?processId=${apply.processid}' target="_blank">流程图</a>）
			</h4>
			<div class="mt-comments">
				<c:forEach var="detail" items="${detailList}">
					<div class="mt-comment">
						<%-- <div class="mt-comment-img">
							<img src="${ctx}/static/assets/layouts/layout4/img/avatar.png" />
						</div> --%>
						<div class="mt-comment-body">
							<div class="mt-comment-info">
								<span class="mt-comment-author">${detail.username}(${detail.nodename})</span> <span
									class="mt-comment-date">${detail.createdtime}</span>
							</div>
							<div class="mt-comment-text">
								<c:if test="${detail.result}">通过</c:if>
								<c:if test="${!detail.result}">不通过</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-default" data-dismiss="modal">返回</a>
		</div>
	</div>
</div>

<script>
var i=10;
function ff(){
	$("#tg").text("通过（"+i+"）");
	i--;
	if(i<1){
		clearInterval(sh);
		$("#tg").text("通过").removeAttr("disabled");
	}
}
var sh=setInterval(ff,1000);

</script>