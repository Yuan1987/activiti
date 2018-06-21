var efCheck = window.NameSpace || {};
$(function() {
	$.fn.modal.Constructor.prototype.enforceFocus = function () {};
	var url=rootPath + "/model/efcheck/list";
	
	if(type==2){//打分
		url=rootPath + "/model/efcheck/markList";
	}
	
	$('#efCheckTable').bootstrapTable({
		method : 'POST',
		contentType : "application/x-www-form-urlencoded",
		queryParamsType : 'pageSize',
		queryParams : function(params) {
			return {
				page : params.pageNumber,
				size : params.pageSize,
				status : $("#status").val()
			};
		},
		url : url,
		cache : false,
		pagination : true,
		searchOnEnterKey : true,
		sidePagination : 'server',
		pageSize : 15,
		toolbar : "#toolbar",
		pageList : [ 5, 15, 30, 50, 100 ],
		onLoadSuccess : function() {},
		formatSearch : function() {
			return '名称';
		}
	});

	//搜索
	$('#status').change(function() {
		$("#efCheckTable").bootstrapTable('refresh');
	});
});

efCheck.checkInfo = function(vid, index, taskId, complete,taskName) {
	$('#efCheckTable').bootstrapTable('uncheckAll');
	$('#efCheckTable').bootstrapTable('check', index);
	$modal = $('#theModal');
	$modal.load(rootPath + "/model/efcheck/checkApplyInfo.html", {
		efid : vid,
		taskId : taskId,
		complete : complete,
		taskName:taskName
	}, function() {
		$("#authType").change(function() {
			var val = this.value;
			if (val == "05") {
				$("#pg").css("display", "block");
				$("#fpg").css("display", "none");
				$("#fh").css("display", "none");
			} else if (val == "04") {
				$("#pg").css("display", "none");
				$("#fpg").css("display", "none");
				$("#fh").css("display", "block");
			} else {
				$("#pg").css("display", "none");
				$("#fpg").css("display", "block");
				$("#fh").css("display", "none");
			}
		});
		$("#authType").change();
		$modal.modal();
	});
};

/*efCheck.check = function(vid, pass, taskId) {
	$modal = $('#doCheck');
	$modal.load(rootPath + "/model/efcheck/toCheck.html", {
		id : vid,
		pass : pass,
		taskId : taskId
	}, function() {
		$modal.modal();
	});
};*/

efCheck.operation = function(value, row, index) {
	
	var text = "审核";
	
	if(row.taskName=='序列小组'){
		text="指定测评人";
		/*$("#status").empty();
		$("#status").append("<option selected=\"selected\" value=\"0\">待指定</option>");
		$("#status").append("<option value=\"1\">已指定</option>");*/
	}
	
	if(type==2){
		text="测评";
	}
	
	if (row.complete) {
		text = "查看";
	}
	return "<a href=javascript:efCheck.checkInfo('" + row.evaluationFormId + "'," + index +
			",'" + row.taskId + "','" + row.complete + "','" + row.taskName + "')>" + text + "</a>"
};