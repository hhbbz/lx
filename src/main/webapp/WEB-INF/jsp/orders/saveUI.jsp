<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/24
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看订单</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <%@ include file="../se7en_css.jsp"%>
    <%@ include file="../se7en_js.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
</head>
<body>
<div class="modal-shiftfix">
    <div class="container-fluid main-content">
        <div class="invoice">
            <div class="row">
                <div class="col-lg-12">
                    <div class="widget-container fluid-height">
                        <div class="widget-content padded clearfix">
                            <table class="table table-striped invoice-table">
                                <thead>
                                <th width="55">客户:<br/>${orders.name}</th>
                                <th>
                                    产品
                                </th>
                                <th width="70">
                                    数量
                                </th>
                                <th width="100">
                                    单价
                                </th>
                                <th width="100">
                                    总价
                                </th>
                                </thead>
                                <tbody>
                                <c:forEach items="${memberProductOrderses}" var="product">
                                    <tr >
                                        <td></td>
                                        <td>
                                                ${product.name}
                                        </td>
                                        <td>
                                                ${product.number}
                                        </td>
                                        <td id="${product.id}" class="money">

                                                ${product.money}
                                        </td>
                                        <td id="${product.id}" class="total">
                                                ${product.number*product.money}
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td class="text-right" colspan="4">
                                        <h4 class="text-primary">
                                            Total
                                        </h4>
                                    </td>
                                    <td>
                                        <h4 class="text-primary" >
                                            ${orders.money}
                                        </h4>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="well" >
                        <strong>送货地址</strong>
                        <div contenteditable="true" id="address">
                            <br/>${orders.address}
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="well" >
                        <strong>备注及送货电话</strong>
                        <div contenteditable="true" id="mark">
                            <br/><br/>${orders.mark}
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <a class="btn btn-primary pull-right" id="orders"><i class="icon-print"></i>关闭</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>