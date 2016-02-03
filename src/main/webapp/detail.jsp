<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/1/22
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay.css">
    <style type="text/css">
        .img-responsive{display:block;height:500px;width:650px}
    </style>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script><!-- main jquery -->
    <!-- 消息弹框 -->
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/base.js"></script>
</head>
<body>
<article class="flex-col  pay-main">
    <section class="pay-wrap flex-row container">
        <div class="products-img flex-row">
            <img class="img-responsive"src="${pageContext.request.contextPath}/resources/file/product/${product.picture}"/>
        </div>
        <div class="pay-info">

            <ul class="flex-col">

                <li><h2>产品名称：<span id="name">${product.name}</span></h2></li>
                <li hidden><span>id：<span id="id">${product.id}</span></span></li>
                <li><span>产品类型：<span id="type">${product.productType.name}</span></span></li>
                <li><span>单价：<span id="money">${product.money}</span></span></li>
                <li><span>数量：<a href="#" class="minus">减</a><span id="number"><input value="1" pid="number" maxlength="3" name="number" ></span><a href="#" class="plus">加</a></span></li>
                <li><button class="btn btn-blue bg-danger" id="addCart"> 加入购物车</button></li>
            </ul>
            总价：<span id="total"></span>
        </div>
    </section>
    <section class="introduce bg-blank">
        <div class="container introduce-wrap">
            <div class="introduce-title">
                <div class="introduce-title-1 flex-center">详情介绍</div>  <div class="introduce-title-2"></div>

            </div>
            <div class="introduce-info">
                <p>${product.introduction}</p>
            </div>

        </div>

    </section>

</article>
<!-- 下单按钮的点击事件 -->
<script type="text/javascript">
    $('#addCart').on('click' , function(){
        var id =  $("#id").text()
        var name = $("#name").text()
        var money = $("#money").text()
        var number = $("input[pid=number]").val()
        var total = $("#total").text()
        var memberProduct = {id:id,name:name,money:money,number:number,total:total}
        alert(JSON.stringify(memberProduct))
        $.ajax({
            url: "${pageContext.request.contextPath}/cart/addCart",
            type:"post",
            contentType : 'application/json;charset=UTF-8',
            data :JSON.stringify(memberProduct),
            cache: false,
            dataType : 'json',
            async : false,
            success:function(data){
                if(data.success==true){
                    $._messengerDefaults = {
                        extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                    }
                    $.globalMessenger().post({  message:"提示："+ data.msg,
                        type: "success",
                        showCloseButton: true})
                }else{
                    $._messengerDefaults = {
                        extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                    }
                    $.globalMessenger().post({  message:"提示："+ data.msg,
                        type: "error",
                        showCloseButton: true})
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    })
</script>
<!-- 控制数量和总价增减的jquery -->
<script type="text/javascript">
    $(function(){
        var money = parseFloat($("#money").text())
        var number = $("input[pid=number]").val()
        $("#total").text((money*number).toFixed(2))
    })
    $('a.minus').on('click',function(){
        var input = $("input[pid=number]")
        var num = parseFloat(input.val())
        var money = parseFloat($("#money").text())
        var total = parseFloat($("#total").text())
        if(num > 1){
            input.val(num-1)
            total = (num-1) * money
            $("#total").text(total.toFixed(2))
        }
    })
    $('a.plus').on('click',function(){
        var input = $("input[pid=number]")
        var num = parseFloat(input.val())
        var money = parseFloat($("#money").text())
        var total = parseFloat($("#total").text())
        if(num < 60 ){
            input.val(num+1)
            total = (num+1) * money
            $("#total").text(total.toFixed(2))
        }
    })
    $("input").bind("input propertychange",function(){
        var num = parseFloat($(this).val())
        var money = parseFloat($("#money").text())
        var total = parseFloat($("#total").text())
        if(num >= 0 && num <= 60) {
            total = num * money
            $("#total").text(total.toFixed(2))
        }else{
            $(this).val(0)
            total = 0
            $("#total").text(total.toFixed(2))
        }
    })
</script>
</body>
</html>