
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<link rel="stylesheet" href="${ctx}/static/assets/global/plugins/select2/css/select2.min.css" type="text/css">
<link rel="stylesheet" href="${ctx}/static/assets/global/plugins/select2/css/select2-bootstrap.min.css"type="text/css" />

<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEAD-->
        <ul class="page-breadcrumb breadcrumb">
            <li><a href="#">个人设置</a> <i class="fa fa-circle"></i></li>
            <li><span class="active">我的能力</span></li>
        </ul>
        <!-- END PAGE BREADCRUMB -->
        <!-- BEGIN PAGE BASE CONTENT -->
        <div class="row">
            <div class="col-md-12">
                <div class="m-top-up-15">
                    <div class="fixed-table-toolbar">
                        <div class="bs-bars pull-left">
                            <div id="toolbar">
                                <button id="btnAdd" class="btn btn-sm">
                                    <i class="fa fa-plus"></i> 新增
                                </button>
                                <button id="btnUpdate" class="btn btn-sm">
                                    <i class="fa fa-upload"></i> 修改
                                </button>
                                <button id="btndelete" class="btn btn-sm btn-danger">
                                    <i class="glyphicon glyphicon-remove"></i> 删除
                                </button>
                            </div>
                        </div>
                    </div>
                    <table id="AbilityTable" class="table"
                           data-side-pagination="server" data-pagination="true"
                           data-row-style="rowStyle" data-side-pagination="server"
                           data-page-list="[10,15, 20, 50, 100, 200]"
                           data-search="true" data-show-refresh="true" data-show-toggle="true"
                           data-show-columns="true"
                           data-show-export="true">
                        <thead>
                        <tr>
                            <th data-checkbox="true"></th>
                            <th data-field="abilityItem" data-halign="center"
                                data-align="center">能力名称</th>
                            <th data-field="abilityDesc" data-halign="center"
                                data-align="center">能力描述</th>
                            <%--<th data-field="msg" data-halign="center"--%>
                                <%--data-align="center">附件信息</th>--%>
                            <th data-field="createTime" data-halign="center"
                                data-align="center">创建时间</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/static/model/myAbility.js?version=1.0.1&${staticVersion}"></script>
<script>
    var rootPath = '${ctx}';
</script>

