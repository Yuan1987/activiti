<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header padding-sty">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3 id="modelTitle">附件信息</h3>
			<form id="fileForm" class="form-horizontal" method="get"
				enctype="multipart/form-data">
				<div class="portlet light bordered">
					<div class="form-group">
						<label class="col-sm-2 control-label">附件</label>
						<div class="col-sm-10">
							<input name="paId" value="${paId}" hidden="hidden" id="paId" /> <input
								type="file" name="file" id="input-ke-3" multiple="multiple"/>
						</div>
					</div>
					
					<c:forEach var="af" items="${pa.files}">
						<div class="form-group" id="${af.guid}">
							<label class="col-sm-2 control-label">《${af.friendlyfilename}》描述</label>
							<div class="col-sm-10">
								<input name="fileIds" type="hidden" value="${af.guid}">
								<textarea rows="4" name="description" class="form-control">${af.description}</textarea>
							</div>
						</div>
					</c:forEach>
					<div id="newD">
					</div>
					
					<div class="modal-footer">
						<c:if test="${efstatus=='草稿'||efstatus=='审核未通过'}">
							<button type="submit" class="btn btn-primary">保存</button>
						</c:if>
						<a href="javascript:modalHide();" class="btn btn-default"
							data-dismiss="modal">返回</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	
	var fileBasePath="${fileBasePath}";

	$(function() {
	
		var pa={};
	
		$.ajax({
			dataType : "json",
			url : rootPath + "/model/evaluation/fileJSON?paId=${paId}",
			type : "post",
			async : false,
			success : function(data) {
				pa=data;
			},
			error : function() {
				layer.alert("加载失败", {
					title : '提示',
					icon : 2,
					skin : 'layer-ext-moon'
				});
			}
		});

		var files=pa.files;
		var paId=pa.id;
		
		var initialPreviewConfig=[];
		var initialPreview=[];
		
		$.each(files,function(i,n){
			initialPreview.push(fileBasePath+n.filephysicalpath);
			var config={
				caption:n.friendlyfilename,
				size:n.filesize,
				url:rootPath + "/model/evaluation/fileDelete?paId="+paId+"&fileId="+n.guid,
				key:n.guid,
				downloadUrl:fileBasePath+n.filephysicalpath
			};
			initialPreviewConfig.push(config);
		});
		
		
		console.info(initialPreviewConfig);
		console.info(initialPreview);
		
		$("#input-ke-3").fileinput({
			language : 'zh',
			hideThumbnailContent : true, // hide image, pdf, text or other content in the thumbnail preview
			theme : "explorer",
			//uploadUrl : "/file-upload-batch/2",
			showRemove : true,
			overwriteInitial : false,
			preferIconicPreview: true,
			showUpload : false, //是否显示上传按钮  
			initialPreview:initialPreview,
			initialPreviewAsData : true, // defaults markup  
			initialPreviewConfig:initialPreviewConfig,
			fileActionSettings: {showDrag:false},
		});
		
		$('#input-ke-3').on('filedeleted', function(event, id){
		   $("#"+id).remove();
	       $("#evaluFormTable").bootstrapTable('refresh'); 
		});  
		
		$('#input-ke-3').on('fileselect', function(event, numFiles, label) {
		    console.log(numFiles +"--"+label);
		    
		   $("#newdescription").css("display","block");
		   
   	   	   $("#newD").append("<div class=\"form-group\">"
					+"<label class=\"col-sm-2 control-label\">描述</label>"
					+"<div class=\"col-sm-10\">"
					+	"<textarea rows=\"4\" name=\"newDescription\" class=\"form-control\"></textarea>"
					+"</div></div>");
		   
		});
		
	});

	bootstrapValidator = $('#fileForm').bootstrapValidator({
		excluded : [ ':disabled' ],
		fields : {
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		$("#fileForm").ajaxSubmit({
			type : "POST",
			url : rootPath + "/model/evaluation/fileUpload",
			success : function(data) {

				if (data.message == "操作成功！") {
					$("#evaluFormTable").bootstrapTable('refresh');
					$("#paFileModal").modal("hide");
				}

				layer.alert(data.message, {
					title : '提示',
					icon : 0
				});
			},
			error : function(msg) {
				layer.alert('操作失败！', {
					title : '提示',
					icon : 2
				});
			}
		});
	});
</script>