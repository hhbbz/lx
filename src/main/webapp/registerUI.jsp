<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        用户注册
    </title>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/admin/javascripts/jquery.validate.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body class="login2">
<!-- Signup Screen -->
<div class="login-wrapper">
    <form action="${pageContext.request.contextPath}/member/register" method="post" id="register_form">
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input class="form-control" type="text"   required name="loginName" onkeyup="this.value=this.value.replace(/[\W]/g,'')" placeholder="登录账号名不能为中文" />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-lock"></i></span>
                <input class="form-control" type="password" required name="password" placeholder="请输入密码" >
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input class="form-control" type="text"  required name="name" placeholder="请输入您的姓名" />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-envelope"></i></span>
                <input class="form-control" type="email"  name="email" placeholder="请输入您的邮箱地址" />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-mobile-phone "></i></span>
                <input class="form-control" type="text"  required name="phoneNumber" placeholder="请输入您的手机号码" />
            </div>
        </div>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="注册">
        <div class="social-login clearfix">
            <a class="btn btn-primary twitter" href="${pageContext.request.contextPath}/" >返回首页</a>
        </div>
        <p>
            已经有账户了？
        </p>
        <a class="btn btn-default-outline btn-block" href="${pageContext.request.contextPath}/member/loginUI">立即登录</a>
    </form>
</div>
<!-- End Signup Screen -->
</body>

<c:if test="${result!=null}">
    <script>
        $().ready(function(){
            var success=${result.success};
            var msg='${result.msg}';
            $._messengerDefaults = {
                extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
            }
            $.globalMessenger().post({  message:"提示："+ msg,
                type: "error",
                showCloseButton: true})

        })
    </script>
</c:if>
</html>