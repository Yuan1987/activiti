$(function() {
	$("#orgIds").val(orgIds).select2({
		language : "zh-CN",
		placeholder : "请选择",
		width:"100%",
		templateSelection:function(item){
			return item.text;
		}
	});

	bootstrapValidator = $('#userForm').bootstrapValidator({
		excluded : [ ':disabled' ],
		fields : {
			orgIds: {
		 		trigger:"change",
				 validators: {
		             notEmpty: {
			         }
		         } 
		    },roleIds: {
		 		trigger:"change",
				 validators: {
		             notEmpty: {
			         }
		         } 
		    }
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		$.ajax({
			dataType : "json",
			url : rootPath + "/system/userManager/add",
			type : "post",
			data : $("#userForm").serialize(),
			success : function(data) {
				if (data.message == "操作成功！") {
					$("#userTable").bootstrapTable('refresh');
					$("#userModal").modal("hide");
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
	
	$("#role").select2({
		language : "zh-CN",
		width:"100%",
		ajax:{
			url : rootPath + "/system/roleManager/roleListByOrgId?orgId=" + orgIds,
			dataType : 'json',
			type : "post",
			quietMillis : 250,
			data : function(term, page) {
				return {
					query : term, // search term
				};
			},
			processResults : function(data, page) {
				
				console.info(data);
				
				return {
					results : data
				};
			},
			cache : true
		},
        templateSelection: function(item){
        	return item.text;
        }
	});
});

function orgChange(){
	var orgIds=$("#orgIds").val();
	$("#role").val("");
	$("#role").select2({
		language : "zh-CN",
		width:"100%",
		ajax:{
			url : rootPath + "/system/roleManager/roleListByOrgId?orgId=" + orgIds,
			dataType : 'json',
			type : "post",
			quietMillis : 250,
			data : function(term, page) {
				return {
					query : term, // search term
				};
			},
			processResults : function(data, page) {
				
				console.info(data);
				
				return {
					results : data
				};
			},
			cache : true
		},
        templateSelection: function(item){
        	return item.text;
        }
	});
}
