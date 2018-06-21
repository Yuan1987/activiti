$(function() {
    $('#AbilityTable').bootstrapTable({
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
        url : rootPath + "/system/personal-settings/list",
        cache : false,
        pagination : true,
        searchOnEnterKey:true,
        sidePagination : 'server',
        toolbar:"#toolbar",
        pageSize : 2,
        pageList : [ 5, 15, 30, 50, 100 ],
        onLoadSuccess : function() {},
        formatSearch : function() {
            return '操作人';
        }
    });
})