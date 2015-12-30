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
    <title></title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <%@ include file="se7en_css.jsp"%>
    <%@ include file="se7en_js.jsp" %>
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
                            <table class="table table-striped invoice-table" >
                                <input hidden="hidden" value="${loginMember.loginName}" id="loginName">
                                <input hidden="hidden" value="${loginMember.name}" id="name">
                                <thead id="cartList">
                                    <th width="50"></th>
                                    <th>
                                        产品
                                    </th>
                                    <th width="2">

                                    </th>
                                    <th width="50">
                                        数量
                                    </th>
                                    <th width="2">

                                    </th>
                                    <th width="80">
                                        单价
                                    </th>
                                    <th width="100">
                                        总价
                                    </th>
                                    <th width="100"></th>
                                </thead>
                                <tbody >

                                    <c:forEach items="${cart}" var="product">
                                        <tr id=${product.id}>
                                            <input hidden="hidden" id="productId" value="${product.id}">
                                            <td>
                                            </td>
                                            <td>
                                                ${product.name}
                                            </td>
                                            <td><a href="#" id="${product.id}" class="minus"><i class="icon-minus"></i></a></td>
                                            <td id="number">
                                                 <input type="text" id="${product.id}" pid="number" value="${product.number}" maxlength="3" class="form-control" >
                                            </td>
                                            <td><a href="#" id="${product.id}" class="plus"><i class="icon-plus"></i></a></td>
                                            <td id="${product.id}" class="money">

                                                ${product.money}
                                            </td>
                                            <td id="${product.id}" class="total">
                                                    ${product.total}
                                            </td>
                                            <td>
                                                <a class="delete" id="${product.id}"><button class="btn btn-xs btn-danger-outline"><i class="icon-trash"></i>Delete</button></a>
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
                                        <h4 class="text-primary" id="totalAll">

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
                        <div contenteditable="true" id="address" name="address">
                            <br/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="well" >
                        <strong>备注及送货电话</strong>
                        <div contenteditable="true" id="mark" name="mark">
                            <br/><br/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                        <div class="col-lg-12">
                            <a class="btn btn-primary pull-right" id="orders" ><i class="icon-print"></i>提交订单</a>
                        </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var totalAll = 0;
        $.each(${jsonProduct},function(n,value){
            totalAll += parseFloat(value.total)
        })
        $("#totalAll").text(totalAll.toFixed(2))
        <c:if test="${empty cart}">
            $('a#orders').attr('disabled' , 'true');
            $('#cartList').html('你的购物车还是空的，快去购买吧')
        </c:if>
    })
    $('a.minus').on('click',function(){
        var id = $(this).attr('id')
        var input = $("input[id="+id+"]")
        var num = input.val()
        var totalAll = parseFloat($("#totalAll").text())
        if(num > 1){
            input.val(num-1)
            var total = $("td.total[id="+id+"]").text()
            var money = $("td.money[id="+id+"]").text()
            total = (num-1) * money
            $("td.total[id="+id+"]").text(total.toFixed(2))
            $("#totalAll").text((totalAll - parseFloat(money)).toFixed(2))
        }

    })
    $('a.plus').on('click',function(){
        var id = $(this).attr('id')
        var input = $("input[id="+id+"]")
        var num = parseFloat(input.val())
        var totalAll = parseFloat($("#totalAll").text())
        if(num < 999) {
            input.val(num + 1)
            var total = $("td.total[id=" + id + "]").text()
            var money = $("td.money[id=" + id + "]").text()
            total = (num + 1) * money
            $("td.total[id=" + id + "]").text(total.toFixed(2))
            $("#totalAll").text((totalAll + parseFloat(money)).toFixed(2))
        }
    })
    $("input").bind("input propertychange",function(){
        var id = $(this).attr('id')
        var total = $("td.total[id=" + id + "]").text()
        var money = $("td.money[id=" + id + "]").text()
        var totalAll = parseFloat($("#totalAll").text())
        var num = parseFloat($(this).val())
        if(num > 0) {
            var valDiff = (num * money) - total
            total = num * money
            $("td.total[id=" + id + "]").text(total.toFixed(2))
            if (valDiff > 0) {
                $("#totalAll").text((totalAll + parseFloat(valDiff)).toFixed(2))
            } else if (valDiff < 0) {
                $("#totalAll").text((totalAll + parseFloat(valDiff)).toFixed(2))
            }
        }else{
            $("#totalAll").text((totalAll - parseFloat(total)).toFixed(2))
            $(this).val(0)
            total = 0
            $("td.total[id=" + id + "]").text(total.toFixed(2))
        }
    })
    $('a.delete').on('click',function(){
        var id = $(this).attr('id')
        $.ajax({
            url : "${pageContext.request.contextPath}/cart/delete/"+id,
            type : 'get',
            cache: false,
            dataType : 'json',
            async : false,
            success : function(data) {
                var totalAll = parseFloat($("#totalAll").text())
                var total = parseFloat($('td.total[id='+id+']').text())
                totalAll -= total
                $("#totalAll").text(totalAll.toFixed(2))
                $('tr[id='+id+']').remove()
                $._messengerDefaults = {
                    extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"提示：删除成功",
                    type: "error",
                    showCloseButton: true})

            }
        })
    })
    $('a#orders').on('click',function(){
        var number = [] ;
        for(var i = 0; i < $('input[pid=number]').length; i++){number[i] = $('input[pid=number]')[i].value}  //获取输入框的数值
        var loginName = $('input#loginName').val()
        var name = $('input#name').val()
        var mark = $("div#mark").text()
        var address = $("div#address").text()
        var total = $("#totalAll").text()
        $.ajax({
            url : "${pageContext.request.contextPath}/orders/addOrders/"+loginName,
            type : 'post',
            traditional: true,
            data : {address:address,name:name,mark:mark,number:number,total:total},
            dataType : 'json',
            async : false,
            success : function(data){
                if(data.success==true){
                    window.location.href="${pageContext.request.contextPath}/";
                }else{
                    $._messengerDefaults = {
                        extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                    }
                    $.globalMessenger().post({  message:"提示："+ data.msg,
                        type: "error",
                        showCloseButton: true})
                }

            },
            error : function() {
                alert("请求失败")
            }
        })
    })
</script>
</body>
</html>