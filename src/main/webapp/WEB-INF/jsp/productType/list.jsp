<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>
        产品类型管理
    </title>
    <meta charset="utf-8">
    <%@ include file="../se7en_css.jsp" %>

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body>
<div class="modal-shiftfix">
    <!-- Navigation -->
    <%@ include file="../navigation.jsp" %>
    <div class="alert alert-success " hidden="hidden" id="msg" role="alert">
        <p> 提示:</p>
    </div>
    <!-- End Navigation -->
    <div class="container-fluid main-content">
        <!-- DataTables Example -->
        <div class="row">
            <div class="col-lg-12">
                <div class="widget-container fluid-height clearfix">
                    <div class="heading">
                        <i class="icon-table"></i>产品类型管理<a class="btn btn-sm btn-primary-outline pull-right"  href="#" id="add-row"><i class="icon-plus"></i>添加</a>
                    </div>
                    <div class="widget-content padded clearfix">
                        <table class="table table-bordered table-striped" id="datatable-editable">
                            <thead>
                            <th>
                                类型名称
                            </th>
                            <th>
                                类型简介
                            </th>
                            <th width="90"></th>
                            <th width="90"></th>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${list}" >
                                <tr>
                                    <td>
                                            ${item.name}
                                    </td>
                                    <td>
                                            ${item.introduction}
                                    </td>
                                    <td>
                                        <a class="edit-row" name="${item.id}"  href="#">编辑</a>
                                    </td>
                                    <td>
                                        <a class="delete-row"  name="${item.id}" href="#">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- end DataTables Example -->
    </div>
</div>
<%@ include file="../se7en_js.jsp" %>
<script>
	$(function(){
	    $("#product_page").addClass("current");
	})
    function restoreRow ( oTable, nRow )
    {
        var aData = oTable.fnGetData(nRow);
        var jqTds = $('>td', nRow);

        for ( var i=0, iLen=jqTds.length ; i<iLen ; i++ ) {
            oTable.fnUpdate( aData[i], nRow, i, false );
        }

        oTable.fnDraw();
    }

    function editRow ( oTable, nRow )
    {
        var aData = oTable.fnGetData(nRow);
        var jqTds = $('>td', nRow);
        jqTds[0].innerHTML = '<input type="text" value="'+aData[0]+'">';
        jqTds[1].innerHTML = '<input type="text" value="'+aData[1]+'">';
        jqTds[2].innerHTML = '<a class="edit-row" href="javascript:void(0)">保存</a>';
        jqTds[3].innerHTML = '<a class="delete-row" href="javascript:void(0)">删除</a>';
    }

    function saveRow ( oTable, nRow )
    {
        var jqInputs = $('input', nRow);
        oTable.fnUpdate( jqInputs[0].value, nRow, 0, false );
        oTable.fnUpdate( jqInputs[1].value, nRow, 1, false );
        oTable.fnUpdate( '<a class="edit-row" href="javascript:void(0)">编辑</a>', nRow, 2, false );
        oTable.fnUpdate( '<a class="delete-row" href="javascript:void(0)">删除</a>', nRow, 3, false );
        oTable.fnDraw();
    }

    $(document).ready(function() {
        var oTable = $("#datatable-editable").dataTable({
            "sPaginationType": "full_numbers",
            "oLanguage" : { // 汉化
                "sProcessing" : "正在加载数据...",
                "sLengthMenu" : "显示_MENU_条 ",
                "sZeroRecords" : "没有您要搜索的内容",
                "sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_  条)",
                "sInfoPostFix" : "",
                "sSearch" : "搜索",
                "sUrl" : "",
                "oPaginate" : {
                    "sFirst" : "第一页",
                    "sPrevious" : " 上一页 ",
                    "sNext" : " 下一页 ",
                    "sLast" : " 最后一页 "
                }
            },
            aoColumnDefs: [
                {
                    bSortable: false,
                    aTargets: [-2, -1]
                }
            ]
        });
        var nEditing = null;

        $('#add-row').click( function (e) {
            if ( nEditing !== null ) {
                alert("请先保存编辑的数据")
                return ;
            }
            e.preventDefault();
            var aiNew = oTable.fnAddData( [ '', '',
                '<a class="edit-row" href="javascript:void(0)">Edit</a>', '<a class="delete-row" href="javascript:void(0)">Delete</a>' ] );
            var nRow = oTable.fnGetNodes( aiNew[0] );
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
            jqTds[0].innerHTML = '<input type="text" value="'+aData[0]+'">';
            jqTds[1].innerHTML = '<input type="text" value="'+aData[1]+'">';
            jqTds[2].innerHTML = '<a class="save-row" href="javascript:void(0)">保存添加</a>';
            jqTds[3].innerHTML = '<a class="delete-row" href="javascript:void(0)">删除</a>';
            nEditing = nRow;
        } );
        $('#datatable-editable').on('click', 'a.save-row', function (e) {
            var nRow = $(this).parents('tr')[0];
            var id;
            if($(this).attr("name")){
                id=$(this).attr("name");
            }
            var jqInputs = $('input', nRow);
            $.post("${pageContext.request.contextPath}/admin/productType/save",{ name: jqInputs[0].value, introduction:jqInputs[1].value} , function(result){
                console.info(result);
                if(result.success==true){
                    oTable.fnUpdate( result.obj.name, nRow, 0, false );
                    oTable.fnUpdate( result.obj.introduction, nRow, 1, false );
                    oTable.fnUpdate( '<a class="edit-row" name="'+result.obj.id+'" href="javascript:void(0)">编辑</a>', nRow, 2, false );
                    oTable.fnUpdate( '<a class="delete-row" name="'+result.obj.id+'" href="javascript:void(0)">删除</a>', nRow, 3, false );
                    oTable.fnDraw();
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }else{
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                    oTable.fnDeleteRow( nRow );
                }
                setTimeout(function(){    //设时延迟0.5s执行
                    $("#msg").attr("hidden","hidden");
                },2000)
            },"json");
            nEditing = null;
        } );
        $('#datatable-editable').on('click', 'a.delete-row', function (e) {
            var id=$(this).attr("name");
            var nRow = $(this).parents('tr')[0];
            if($(this).attr("name")){   $.post("${pageContext.request.contextPath}/admin/productType/delete/"+id, function(result){
                if(result.success){
                    oTable.fnDeleteRow( nRow );
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }else{
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }
                setTimeout(function(){    //设时延迟0.5s执行
                    $("#msg").attr("hidden","hidden");
                },2000)
            },"json");
            }else{
                oTable.fnDeleteRow( nRow );
                nEditing = null;
            }
        } );
        $('#datatable-editable').on('click', 'a.update-row', function (e) {
            var id=$(this).attr("name");
            var name=$("#first").val();
            var introduction=$("#second").val();
            var nRow = $(this).parents('tr')[0];
            $.post("${pageContext.request.contextPath}/admin/productType/update/",{"id":id,"name":name,"introduction":introduction}, function(result){
                if(result.success){
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                    oTable.fnUpdate( name, nRow, 0, false );
                    oTable.fnUpdate( introduction, nRow, 1, false );
                    oTable.fnUpdate( '<a class="edit-row" name="'+id+'" href="javascript:void(0)">编辑</a>', nRow, 2, false );
                    oTable.fnUpdate( '<a class="delete-row" name="'+id+'" href="javascript:void(0)">删除</a>', nRow, 3, false );
                    oTable.fnDraw();
                }else{
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }
                setTimeout(function(){    //设时延迟0.5s执行
                    $("#msg").attr("hidden","hidden");
                
                },2000)
            },"json");
            
        } );
        

        $('#datatable-editable').on('click', 'a.edit-row', function (e) {
            e.preventDefault();
            var nRow = $(this).parents('tr')[0];
            var id=$(this).attr("name");
            if ( nEditing !== null  ) {
                alert("请先保存编辑的数据")
                return ;
            }
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
            jqTds[0].innerHTML = '<input type="text" id="first" value="'+aData[0]+'">';
            jqTds[1].innerHTML = '<input type="text" id="second" value="'+aData[1]+'">';
            jqTds[2].innerHTML = '<a class="update-row" name="'+id+'" href="javascript:void(0)">保存编辑</a>';
            jqTds[3].innerHTML = '<a class="cancel-row" href="javascript:void(0)">取消编辑</a>';
        } );
        $('#datatable-editable').on('click', 'a.cancel-row', function (e) {
            var id=$(this).attr("name");
            var nRow = $(this).parents('tr')[0];
            restoreRow( oTable,nRow );
            nEditing = null;
        } );
    } );
</script>
</body>
</html>