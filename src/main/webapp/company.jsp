<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/7
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>麻轮-阳江市琪笙抛光轮有限公司</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" href="web1.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/pagers/css/style.css" media="screen"/>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/admin/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF">
<div class="cart-details">
    <div  class="login-rigister">
        <c:choose>
            <c:when test="${loginMember!=null}">
                <ul class="unstyled-list list-inline">
                    <li>欢迎！<span style="color: #0088FF;margin: 0;padding: 0">${loginMember.name}</span></li>
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
        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/title03.gif" height="71" width="778" /></td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>
        <td width="94"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_03.gif" height="34" width="94" /></td>
        <td width="91"><a href="default.htm"><img src="${pageContext.request.contextPath}/resources/images/product-index/2_04.gif" height="34" border="0" width="91" /></a></td>
        <td width="92"><img src="${pageContext.request.contextPath}/resources/images/product-index/2_05.gif" height="34" border="0" width="92" /></td>
        <td width="92"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_06.gif" height="34" border="0" width="92" /></a></td>
        <td width="92"><a href="${pageContext.request.contextPath}/member/orders"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_07.gif" height="34" border="0" width="92" /></a></td>
        <td width="93"><a href="info.html"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_08.gif" height="34" border="0" width="93" /></a></td>
        <td width="93"><a href="english/e-company.html"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_09.gif" height="34" border="0" width="93" /></a></td>
        <td width="92"><a href="mailto:lxml@yjlx.com"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_10.gif" height="34" border="0" width="92" /></a></td>
        <td width="39"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_11.gif" height="34" width="39" /></td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="599" align="center">
    <tbody>
    <tr>
        <td bgcolor="#FFFFFF" valign="top" width="204">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" align="right">
                <tbody>
                <tr>
                    <td height="275"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_12.gif" height="275" width="203" /></td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF">
                        <table border="0" cellpadding="0" cellspacing="0" width="90%" align="center">
                            <tbody>
                            <tr>
                                <td> <script language="JavaScript">

                                    <!--//
                                    var version = "other"
                                    browserName = navigator.appName;
                                    browserVer = parseInt(navigator.appVersion);

                                    if (browserName == "Netscape" && browserVer >= 3) version = "n3";
                                    else if (browserName == "Netscape" && browserVer < 3) version = "n2";
                                    else if (browserName == "Microsoft Internet Explorer" && browserVer >= 4) version = "e4";
                                    else if (browserName == "Microsoft Internet Explorer" && browserVer < 4) version = "e3";

                                    function marquee1()
                                    {
                                        if (version == "e4"){
                                            document.write("<marquee behavior=scroll direction=up width=160 height=180 scrollamount=1 scrolldelay=60 onmouseover='this.stop()' onmouseout='this.start()'>")
                                        }
                                    }

                                    function marquee2()
                                    {
                                        if (version == "e4"){
                                            document.write("</marquee>")
                                        }
                                    }

                                    //-->
                                </script> <script language="JavaScript">marquee1();</script> <span class="a">剑麻抛光轮与棉布抛光轮比较，剑麻轮具有质地坚韧、切削力大、耐磨度高、被加工产品表现好、生产效率高、耗用抛光蜡少、节电等优点，而且抛磨时粉尘粒度大而少噪音小，改善了操作条件，技术及经济效果更加明显。</span></td>
                            </tr>
                            </tbody>
                        </table> <p>&nbsp;</p> </td>
                </tr>
                </tbody>
            </table> <p>&nbsp;</p> </td>
        <td bgcolor="#FFFFFF" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" width="58%">
                <tbody>
                <tr>
                    <td colspan="2"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_13.gif" height="43" width="575" /></td>
                </tr>
                <tr>
                    <td width="182"><img src="${pageContext.request.contextPath}/resources/images/product-index/2.gif" height="27" width="182" /></td>
                    <td width="393"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_15.gif" height="27" width="393" /></td>
                </tr>
                </tbody>
            </table> <br />
            <table border="0" cellpadding="0" cellspacing="0" width="480" align="center">
                <tbody>
                <tr>
                    <td bgcolor="#FFFFFF"> <p>　　阳江市琪笙抛光轮有限公司的抛光轮系列产品，伴随广东省阳江市轻工业发展兴旺已有二十多年的生产历史，在众多抛光轮厂中技术一直领先。</p> <p>　　所生产的产品广泛用于抛磨不锈钢、铜、铝、合金以及碳钢制品电镀前后的抛光加工，其中对抛磨不锈钢新产品尤为合适。</p> <p>　　本厂所研制的螺旋式、折迭式、褶绉式、辐片式、京鼓式等产品使用的最大安全线速是45米/秒。</p> <p>　　我们可根据您的需要制成各种系列产品，敬请用户提供轮子的直径、孔径与宽度规格。</p> <p>　　客户根据选择不同的材料，相信我们会使您的产品更上一个台阶。相信您的每一分钱都将在我们的产品的使用中体现出它的价值。我们愿同全国各地的厂家、世界各国贸易界人士密切业务往来，竭诚合作，同时提供优质服务。 我公司希望向海内外客户提供最优质的服务，并与大家共图发展。 </p> <p align="center"><br /> <br /> 诚征各地代理经销商 </p> <p>&nbsp;</p> </td>
                </tr>
                </tbody>
            </table> </td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>
        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/DFHFGJH_02.gif" height="19" width="778" /></td>
    </tr>
    <tr>
        <td bgcolor="#FFFFFF">
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
</body>
</html>
