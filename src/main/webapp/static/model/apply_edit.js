$(function() {
	
	$.fn.modal.Constructor.prototype.enforceFocus = function () {};
	$("#applyForm select").select2({
		language : "zh-CN",
		placeholder : "请选择",
		width:"100%"
	});
	
	$('.year').datepicker({
        orientation: "left",
        language: 'zh-CN',
        autoclose: true,startView: 2,  maxViewMode: 2,minViewMode:2
    });
	
	 $('.date-picker').datepicker({
        orientation: "left",
        language: 'zh-CN',
        autoclose: true
    });
	 
	
	
	$("#authType").change(function(){
		var val=this.value;
		if(val=="05"){
			$("#pg").css("display","block");
			$("#fpg").css("display","none");
			$("#fh").css("display","none");
		}else if(val=="04"){
			$("#pg").css("display","none");
			$("#fpg").css("display","none");
			$("#fh").css("display","block");
		}else{
			$("#pg").css("display","none");
			$("#fpg").css("display","block");
			$("#fh").css("display","none");
		}
	});
	
	$("#authType").change();

	bootstrapValidator = $('#applyForm').bootstrapValidator({
		excluded : [ ':disabled' ],
		fields : {
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		$.ajax({
			dataType : "json",
			url : rootPath + "/model/apply/edit",
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
