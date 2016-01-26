<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>
        产品编辑
    </title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <%@ include file="../se7en_css.jsp" %>
    <%@ include file="../se7en_js.jsp" %>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body>
<div class="modal-shiftfix">
    <!-- Navigation -->
    <%@ include file="../navigation.jsp" %>
    <!-- End Navigation -->
    <div class="container-fluid main-content">
        <div class="page-title">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/index"></a><i class="icon-home"></i>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/product/list">产品列表</a>
                    </li>
                    <li class="active">
                       产品编辑
                    </li>
                </ul>
            </div>
            <div class="col-lg-12">
                <div class="widget-container fluid-height">
                    <div class="heading">
                        <i class="icon-edit"></i>产品编辑
                    </div>

                    <div class="widget-content padded" style="height: 1300px">
                        <form action="${pageContext.request.contextPath}/admin/product/${ product.id == null ? 'add' : 'update'}" id="product_form" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-md-3">产品图片</label>
                                <div class="col-md-4">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">

                                        <div class="fileupload-new img-thumbnail" style="width: 200px; height: 150px;">
                                            <c:choose>
                                                <c:when test="${product.picture!=null}">
                                                    <img src="${pageContext.request.contextPath}/resources/file/product/${product.picture}" >
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/resources/admin/images/noimage.gif" >
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="fileupload-preview fileupload-exists img-thumbnail" style="width: 200px; max-height: 150px"></div>
                                        <div>
                                            <span class="btn btn-default btn-file"><span class="fileupload-new">选择图片</span><span class="fileupload-exists">修改</span><input type="file" name="picture"></span><a class="btn btn-default fileupload-exists" data-dismiss="fileupload" href="#">移除</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group" hidden="hidden">
                                <label class="control-label col-md-3">id</label>
                                <div class="col-md-7" hidden="hidden">
                                    <input name="id" type="hidden" value="${product.id}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">产品名称</label>
                                <div class="col-md-7">
                                    <input class="form-control" placeholder="请输入名称" type="text" name="name" value="${product.name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">产品类型</label>
                                <div class="col-md-7">
                                    <select class="form-control" name="productType">
                                        <option value="${product.productType.id}" >${product.productType.name}:${product.productType.introduction}</option>
                                        <c:forEach items="${productType_list}" var="itm">
                                        <option value="${itm.id}">${itm.name}:${itm.introduction}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">产品单价</label>
                                <div class="col-md-7">
                                    <input class="form-control" placeholder="请输入单价" type="text" name="money" value="${product.money}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">产品简介</label>
                                <div class="col-md-7" >
                                    <textarea name="introduction" id="introduction">${product.introduction}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">操作</label>
                                <div class="col-md-7">
                                    <button class="btn btn-primary" type="submit">${ product.id == null ? '提交' : '修改'}</button>
                                    <a class="btn btn-default-outline" href="${pageContext.request.contextPath}/admin/product/list/">取消</a>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script charset="utf-8" src="${pageContext.request.contextPath}/resources/lib/ckeditor/ckeditor.js"></script>
<script type="application/javascript">
	$(function(){
        $("#product_page").addClass("current");
        $("#product_form").validate({
            rules: {
                name: "required",
                money: {
                    number: true
                }
            },
            messages: {
                name: "请填写名称",
                money: {
                    number: "请输入数字"
                }
            }
        });
	})
    CKEDITOR.replace( 'introduction',{
        height :'500',
        width :' 730',
        toolbar : [
            [ 'Preview','Maximize','Print', 'Image'],
            ['Cut', 'Copy', 'Paste', 'PasteText'],
            ['Link', 'Unlink', 'Anchor'],

            ['Bold', 'Italic', 'Underline', 'Strike', 'TextColor', 'BGColor'],

            ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
            ['Styles', 'Format', 'Font', 'FontSize','LineHeight']
        ],
        filebrowserImageUploadUrl: "${pageContext.request.contextPath}/admin/attachment/fileUpload"
    } );
</script>
</body>
</html>