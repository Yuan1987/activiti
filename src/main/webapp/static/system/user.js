var user = window.NameSpace || {};

$(function(){
	
	$("#userAdd").click(function(){
		var selectedNode = treeDemoObJ.getSelectedNodes()[0];
		var nodeid = selectedNode == undefined ? "" : selectedNode.id;
		$modal=$('#userModal');
	    $modal.load(rootPath+"/system/userManager/add.html?orgId="+nodeid,'', function(){
			$modal.modal();
	    });
	});
	
	$("#userUpload").click(function(){
		$modal=$('#userModal');
	    $modal.load(rootPath+"/system/userManager/userImport.html",'', function(){
			$modal.modal();
	    });
	});
});

user.deleteOne=function(id,index) {
	$('#userTable').bootstrapTable('uncheckAll');
	$('#userTable').bootstrapTable('check', index);
	var index = layer.confirm('确认删除？', {
		btn : [ '确认', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : "POST",
			url : rootPath + "/system/userManager/delete",
			data : {
				id : id
			},
			success : function(data) {
				layer.msg(data.message, {
					icon : 1
				});
				$("#userTable").bootstrapTable('refresh');
				layer.close(index);
			}
		});
	}, function() {
		layer.close(index);
	});
}


user.editClick = function(vid,index) {
	$('#userTable').bootstrapTable('uncheckAll');
	$('#userTable').bootstrapTable('check', index);
	$modal=$('#userModal');
    $modal.load(rootPath+"/system/userManager/edit.html?userId="+vid,'', function(){
		$modal.modal();
    });
};

user.profile = function(vid) {
	$modal=$('#userModal');
    $modal.load(rootPath+"/system/userManager/userProfile.html?userId="+vid,'', function(){
		$modal.modal();
    });
};
