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
    <script src="${pageContext.request.contextPath}/resources/admin/javascripts/validate-methods.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body class="login2">
<!-- Signup Screen -->
<div class="login-wrapper">
    <form action="${pageContext.request.contextPath}/member/${ member.id == null ? 'register' : 'update' }" method="post" novalidate id="register_form">
        <div class="hidden">
            <input name="id" type="hidden" value="${member.id}"/>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input class="form-control" type="text" value="${member.loginName}"  required name="loginName" onkeyup="this.value=this.value.replace(/[\W]/g,'')" placeholder="登录账号名不能为中文" />
            </div>
        </div>

        <c:if test="${member.id == null}">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon-lock"></i></span>
                    <input class="form-control" type="password" id="password" required name="password" placeholder="请输入密码" >
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon-lock"></i></span>
                    <input class="form-control" type="password"  id="confirm_password" required name="confirm_password" placeholder="确认密码" >
                </div>
            </div>
        </c:if>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input class="form-control" type="text" value="${member.name}" required name="name" placeholder="请输入您的姓名" />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-mobile-phone "></i></span>
                <input class="form-control" type="text" value="${member.phoneNumber}" required name="phoneNumber" placeholder="请输入您的手机号码" />
            </div>
        </div>
        <c:if test="${member.id == null}">
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="注册">
        </c:if>
        <c:if test="${member.id != null}">
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="修改">
        </c:if>
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
<script type="text/javascript">
    $(document).ready(function() {
        $("#register_form").validate({
            rules: {
                name:"required",
                loginName: {
                    required: true,
                    minlength: 5
                },
                phoneNumber: {
                    isMobile:true
                },
                password: {
                    required: true,
                    minlength: 6
                },
                confirm_password: {
                    required: true,
                    minlength: 6,
                    equalTo: "#password"
                }
            },
            messages: {
                name: "请填写您的姓名",
                loginName: {
                    required: "请填写您的登陆名",
                    minlength: "管理员名长度不能小于5位"
                },
                password: {
                    required: "请填写密码",
                    minlength: "密码长度不能小于6位"
                },
                confirm_password: {
                    required: "请重复填写密码",
                    minlength: "密码长度不能小于6位",
                    equalTo: "两次密码不一致"
                },
                phoneNumber: '请输入正确的手机号码格式'
            }
        });
    });
</script>
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