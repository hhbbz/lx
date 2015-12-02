
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/6
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.spinner.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/pagers/css/style.css" media="screen"/>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel='stylesheet' type='text/css' />
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
    <style type="text/css">
        body{margin:20px;}
        .spinnerExample{margin:10px 0;}
    </style>
</head>
<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF">
<div class="cart-details">
    <div  class="login-rigister">
        <c:choose>
            <c:when test="${loginMember!=null}">
                <ul class="unstyled-list list-inline">
                    <li>欢迎！<span style="color: #0088FF;margin: 0;padding: 0">${loginMember.name}</span></li>
                    <li><a href="${pageContext.request.contextPath}/cart/show/${loginMember.loginName}"><img src="${pageContext.request.contextPath}/resources/images/shop_cart.png" width="37px" align="right" title="brand-logo" /></a></li>
                    <li><a class="rigister" href="${pageContext.request.contextPath}/member/logout">注销 <span> </span></a></li>
                    <div class="clearfix"> </div>

                </ul>
            </c:when>
            <c:otherwise>
                <ul class="unstyled-list list-inline">
                    <li><a class="login" href="${pageContext.request.contextPath}/member/loginUI">登录</a></li>
                    <li><a class="rigister" href="${pageContext.request.contextPath}/member/registerUI">注册 <span> </span></a></li>
                    <div class="clearfix"> </div>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="clearfix"> </div>
</div>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>

        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/1_01.gif" height="31" width="778" /></td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>
        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/title02.gif" height="71" width="778" /></td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>
        <td width="94"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_03.gif" height="34" width="94" /></td>
        <td width="91"><a href="default.htm"><img src="${pageContext.request.contextPath}/resources/images/product-index/2_04.gif" height="34" border="0" width="91" /></a></td>
        <td width="92"><a href="${pageContext.request.contextPath}/index/company"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_05.gif" height="34" border="0" width="92" /></a></td>
        <td width="92"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/product-index/2_06.gif" height="34" border="0" width="92" /></a></td>
        <td width="92"><a href="orders.jsp"><img src="${pageContext.request.contextPath}/resources/images/product-index/4_07.gif" height="34" border="0" width="92" /></a></td>
        <td width="93"><a href="info.html"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_08.gif" height="34" border="0" width="93" /></a></td>
        <td width="93"><a href="english/e-company.html"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_09.gif" height="34" border="0" width="93" /></a></td>
        <td width="92"><a href="mailto:lxml@yjlx.com"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_10.gif" height="34" border="0" width="92" /></a></td>
        <td width="39"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_11.gif" height="34" width="39" /></td>
    </tr>
    </tbody>
</table>
<table  border="0" cellpadding="0" cellspacing="0" width="599" align="center">
    <tbody>
    <tr>
        <td valign="top" width="204">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" align="right">
                <tbody>
                <tr>
                    <td height="275"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_12.gif" usemap="#Map" height="275" border="0" width="203" /></td>
                </tr>
                <tr>
                    <td> <p>&nbsp;</p> </td>
                </tr>
                </tbody>
            </table> </td>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" width="58%">
                <tbody>
                <tr>
                    <td colspan="2"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_13.gif" height="43" width="575" /></td>
                </tr>
                <tr>
                    <td width="182"><img src="${pageContext.request.contextPath}/resources/images/product-index/4.gif" height="27" width="182" /></td>
                    <td width="393"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_15.gif" height="27" width="393" /></td>
                </tr>
                </tbody>
            </table> <br />
            <table border="0" cellpadding="0" cellspacing="0" width="93%" align="center">
                <tbody>
                <tr>
                    <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tbody id="product_all">
                                    <tr>
                                        <td width="34%">
                                            <div align="center"></div></td>
                                        <td width="34%">
                                            <div align="center"></div></td>
                                        <td width="32%">
                                            <div align="center"></div></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="center"></div></td>
                                        <td>
                                            <div align="center"></div></td>
                                        <td>
                                            <div align="center"></div></td>
                                    </tr>
                                </tbody>
                            </table>
                    </td>
                </tr>
                </tbody>

            </table>
            <div class="pager">
                <div id="pagers" >
                </div>
            </div>
        </td>
    </tr>
    </tbody>

</table>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>
        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/DFHFGJH_02.gif" height="19" width="778" /></td>
    </tr>
    <tr>
        <td>
            <div class="a" align="center">
                Copyright◎2003 阳江市琪笙抛光轮有限公司 版权所有
                <br /> 　电话:0662-3179927 3333527 13922003327 邮箱:lxml@yjlx.com
                <br /> 地址:广东省阳江市江城区325国道边津朗大令洲朝排路17号 站点设计、维护：
                <a href="http://www.foshaninfo.com">追日网络科技</a>
            </div> </td>
    </tr>
    <tr>
        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/DFHFGJH_04.gif" height="4" width="778" /></td>
    </tr>
    </tbody>
</table>
<div align="center">
    <br />
</div>
<p align="center"> <map name="Map"> <area shape="rect" coords="16,116,145,131" href="products1.html"> <area shape="rect" coords="15,158,86,175" href="products3.htm"> <area shape="rect" coords="13,179,43,195" href="products4.htm"> <area shape="rect" coords="15,201,74,216" href="products5.htm"> <area shape="rect" coords="15,222,41,236" href="products6.htm"> <area shape="rect" coords="15,243,86,256" href="products7.htm"> <area shape="rect" coords="12,138,143,152" href="products2.htm"> </map> </p>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/pagers/jquery-1.3.2.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/lib/pagers/jquery.paginate.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.spinner.js"></script>
<script type="text/javascript">
    $(function(){
        $.ajax({
            url : "${pageContext.request.contextPath}/indexPagers",
            type : 'get',
            cache: false,
            dataType : 'json',
            async : false,
            success : function(data) {
                $("#pagers").paginate({
                    count 		: data.totalPages,
                    start 		: 1,
                    display     : 3,
                    border					: false,
                    text_color  			: '#79B5E3',
                    background_color    	: 'none',
                    text_hover_color  		: '#2573AF',
                    background_hover_color	: 'none',
                    images		: false,
                    mouse		: 'press',
                    onChange    : function(page){//本插件唯一可触发的事件,在点击页数的时候触发,只传过来当前被选中的页数,我想这其实足够了.
                        list(page-1);
                    }
                });
                list(0);
            },
            error : function() {
                return;
            }
        });
    })
    function list(pages) {
        $("#product_all").empty()
        $.ajax({
            url : "${pageContext.request.contextPath}/pagers/"+pages,
            type : 'get',
            cache: false,
            dataType : 'json',
            async : false,
            success : function(result) {
                var j = 0
                for(var i = 0; i < result.content.length; i++){
                    if(i%3==0){
                        j++
                        $("#product_all").append("<tr id=product_list"+j+"></tr>")
                        $("#product_all").append("<br>")
                    }
                    $("#product_list"+j).append("<td width=34% id=product"+i+"><div align=center></div></td>")
                    $("#product"+i).append("<div><a href="+"${pageContext.request.contextPath}/show/"+result.content[i].id+"><img src="+"/lx/resources/file/product/"+result.content[i].picture+"  height="+154+" border="+0+" width="+169+" /></a><div style='margin-left:52px'><a id=productName"+result.content[i].id+" href="+"${pageContext.request.contextPath}/show/"+result.content[i].id+">"+result.content[i].name+"</a> ,￥<a class=money"+result.content[i].id+">"+result.content[i].money+"</a></div><div style='margin-left:52px'><input type=text class=spinnerExample id="+result.content[i].id+"><i class=icon-money></i>&nbsp;<span id=total"+result.content[i].id+"></span></div><div style='margin-left:45px'><input value=加入购物车 class=cart  type=submit id="+result.content[i].id+"></div></div>")
                }
                $('.spinnerExample').spinner({});
                $(".cart").click(function(){
                    var id = $(this).attr('id')
                    var name = $('#productName'+id).text()
                    var money = $('a.money'+id).text()
                    var number = $("input.spinnerExample[id="+id+"]").val()
                    var total = $("#total"+id).text()
                    var memberProduct = {id:id,name:name,money:money,number:number,total:total}
                    $.ajax({
                        url: "${pageContext.request.contextPath}/cart/addCart",
                        type:"post",
                        contentType : 'application/json;charset=UTF-8',
                        data :JSON.stringify(memberProduct),
                        cache: false,
                        dataType : 'json',
                        async : false,
                        success:function(data){
                            $._messengerDefaults = {
                                extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                            }
                            $.globalMessenger().post({  message:"提示："+data.msg,
                                type: "success",
                                showCloseButton: true})
                        }
                    })
                })
            },
            error : function() {
                $._messengerDefaults = {
                    extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"提示：内部错误,请稍后购买",
                    type: "error",
                    showCloseButton: true})
            }
        });

    };
</script>
</body>
</html>
