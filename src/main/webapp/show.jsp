
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/6
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>阳江市琪笙抛光轮有限公司</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" href="web1.css" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF">
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
        <td><img src="${pageContext.request.contextPath}/resources/images/product-index/title05.gif" height="71" width="778" /></td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="778" align="center">
    <tbody>
    <tr>
        <td width="94"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_03.gif" height="34" width="94" /></td>
        <td width="91"><a href="default.htm"><img src="${pageContext.request.contextPath}/resources/images/product-index/2_04.gif" height="34" border="0" width="91" /></a></td>
        <td width="92"><a href="${pageContext.request.contextPath}/index/company"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_05.gif" height="34" border="0" width="92" /></a></td>
        <td width="92"><img src="${pageContext.request.contextPath}/resources/images/product-index/3_06.gif" height="34" border="0" width="92" /></td>
        <td width="92"><a href="order.html"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_07.gif" height="34" border="0" width="92" /></a></td>
        <td width="93"><a href="info.html"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_08.gif" height="34" border="0" width="93" /></a></td>
        <td width="93"><a href="${pageContext.request.contextPath}/index/company"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_09.gif" height="34" border="0" width="93" /></a></td>
        <td width="92"><a href="mailto:lxml@yjlx.com"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_10.gif" height="34" border="0" width="92" /></a></td>
        <td width="39"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_11.gif" height="34" width="39" /></td>
    </tr>
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="599" align="center">
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
                    <td width="182"><img src="${pageContext.request.contextPath}/resources/images/product-index/3.gif" height="27" width="182" /></td>
                    <td width="393"><img src="${pageContext.request.contextPath}/resources/images/product-index/1_15.gif" height="27" width="393" /></td>
                </tr>
                </tbody>
            </table> <br />
            <table border="0" cellpadding="0" cellspacing="0" width="93%" align="center">
                <tbody>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                            <tbody>
                            <tr>
                                <td class="text" height="340"> <br />
                                    <table border="0" cellpadding="0" cellspacing="2" width="77%" align="center">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <div align="center">
                                                    <span class="txt14"><font color="#993300"><strong>产品介绍 &gt;&gt; ${product.productType.name} &gt;&gt; ${product.name}</strong></font></span>
                                                </div> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" width="399" align="center">
                                        <tbody>
                                        <tr>
                                            <td><img src="${pageContext.request.contextPath}/resources/file/product/${product.picture}" tppabs="http://www.yjlx.com/1.gif" height="310" width="385" /></td>
                                        </tr>
                                        </tbody>
                                    </table> <br />
                                    <table bgcolor="#000000" border="0" cellpadding="0" cellspacing="1" width="76%" align="center">
                                        <tbody>
                                        <tr>
                                            <td height="30" bgcolor="#F7FBFF" width="22%">
                                                <div align="center">
                                                    简 介
                                                </div> </td>
                                            <td height="30" bgcolor="#f7f8f8" width="78%">
                                                <div align="center">
                                                    ${product.introduction}
                                                </div> </td>
                                        </tr>
                                        <tr>
                                            <td height="30" bgcolor="#F7FBFF" width="22%">
                                                <div align="center">
                                                    厚 度
                                                </div> </td>
                                            <td height="30" bgcolor="#f7f8f8" width="78%">
                                                <div align="center">
                                                    依需要制作
                                                </div> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </td>
                            </tr>
                            <tr>
                                <td class="text">
                                    <div align="center"></div> </td>
                            </tr>
                            </tbody>
                        </table> </td>
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
<p> <map name="Map"> <area shape="rect" coords="16,116,145,131" href="products1.html"> <area shape="rect" coords="15,158,86,175" href="products3.htm"> <area shape="rect" coords="13,179,43,195" href="products4.htm"> <area shape="rect" coords="14,201,73,216" href="products5.htm"> <area shape="rect" coords="15,222,41,236" href="products6.htm"> <area shape="rect" coords="15,243,86,256" href="products7.htm"> <area shape="rect" coords="12,138,143,152" href="products2.htm"> </map> </p>
</body>
</html>
