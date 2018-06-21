var dic = window.NameSpace || {};
$(function() {
	
	$('#dicTable').bootstrapTable({
		method : 'POST',
		contentType : "application/x-www-form-urlencoded",
		queryParamsType : 'pageSize',
		queryParams : function(params) {
			return {
				page : params.pageNumber,
				size : params.pageSize,
				searchText : params.searchText
			};
		},
		url : rootPath + "/system/dictionary/list",
		cache : false,
		pagination : true,
		searchOnEnterKey:true,
		sidePagination : 'server',
		toolbar:"#toolbar",
		pageSize : 15,
		pageList : [ 5, 15, 30, 50, 100 ],
		onLoadSuccess : function() {},
		formatSearch : function() {
			return '名称';
		}
	});
	
	$("#dicAdd").click(function(){
		$modal=$('#dicModal');
	    $modal.load(rootPath+"/system/dictionary/add.html",'', function(){
			$modal.modal();
	    });
	});
	
	$("#import").click(function(){
		$modal=$('#dicModal');
	    $modal.load(rootPath+"/system/dictionary/import.html",'', function(){
			$modal.modal();
	    });
	});

	//批量删除
	$("#btn-delete").click(function() {
		var checked=$('#dicTable').bootstrapTable('getSelections');
		var chk_value =[];
	 	for (var i = 0,len=checked.length; i <len; i++){
			chk_value.push(checked[i].id);
	 	}
	 	if(chk_value.length==0){
	 		layer.alert("请选择一条数据", {
				title : '提示',
				icon : 0
			});
	   		return;
	 	}
		index = layer.confirm('确认删除选中的数据吗？', {
			btn : [ '确认', '取消' ] //按钮
		}, function() {
			$.ajax({
				type : "POST",
				url : rootPath + "/system/dictionary/batchDelete",
				data : {
					ids : chk_value.join()
				},
				success : function(data) {
					layer.msg(data.message, {
						icon : 1
					});
					$("#dicTable").bootstrapTable('refresh');
					layer.close(index);
				}
			});
		}, function() {
			layer.close(index);
		});
	});

})

dic.deleteOne=function(id,index) {
	$('#dicTable').bootstrapTable('uncheckAll');
	$('#dicTable').bootstrapTable('check', index);
	
	var index = layer.confirm('确认删除选中的数据吗？', {
		btn : [ '确认', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : "POST",
			url : rootPath + "/system/dictionary/batchDelete",
			data : {
				ids : id
			},
			success : function(data) {
				layer.msg(data.message, {
					icon : 1
				});
				$("#dicTable").bootstrapTable('refresh');
				layer.close(index);
			}
		});
	}, function() {
		layer.close(index);
	});
}

dic.editClick = function(vid,index) {
	$('#dicTable').bootstrapTable('uncheckAll');
	$('#dicTable').bootstrapTable('check', index);
	$modal=$('#dicModal');
    $modal.load(rootPath+"/system/dictionary/edit.html?id="+vid,'', function(){
		$modal.modal();
    });
};

dic.operation = function(value,row,index) {
	return "<a href=javascript:dic.editClick('" + row.id + "',"+index+") title='修改'><span class='fa fa-edit'></span></a>&nbsp;&nbsp;&nbsp;"
	+ "<a href=javascript:dic.deleteOne('"
	+ row.id + "',"+index+") title='删除'><span class='glyphicon glyphicon-trash'></span></a>";
};