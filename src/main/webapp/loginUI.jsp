<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>
        用户登录
    </title>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body class="login2">
<!-- Login Screen -->
<div class="login-wrapper">

    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input class="form-control" placeholder="用户名" name="loginName" required type="text">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-lock"></i></span>
                <input class="form-control" placeholder="密码" type="password" required name="password">
            </div>
        </div>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="登录">
    </form>
        <div class="social-login clearfix">
            <a class="btn btn-primary twitter" href="${pageContext.request.contextPath}/" >返回首页</a>
        </div>
    <p>
        还没有账户？
    </p>
    <a class="btn btn-default-outline btn-block" href="${pageContext.request.contextPath}/member/registerUI">立即注册</a>
</div>
</body>
<c:if test="${result!=null}">
    <script>
        $().ready(function(){
            var success=${result.success};
            var msg='${result.msg}';
            var type="error";
            if(success=true){
                type="success"
            }
            $._messengerDefaults = {
                extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
            }
            $.globalMessenger().post({  message:"提示："+ msg,
                type: type,
                showCloseButton: true})

        })
    </script>
</c:if>
</html>