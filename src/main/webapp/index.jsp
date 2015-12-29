<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/11/11
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
    <!-- meta character set -->
    <meta charset="utf-8">
    <!-- Always force latest IE rendering engine or request Chrome Frame -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>XX点餐网</title>
    <!-- Meta Description -->
    <meta name="description" content="Blue One Page Creative HTML5 Template">
    <meta name="keywords" content="one page, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
    <meta name="author" content="Muhammad Morshed">

    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS
    ================================================== -->

    <%--<link href='http://fonts.useso.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>--%>

    <!-- Fontawesome Icon font -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/font-awesome.min.css">
    <!-- bootstrap.min -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/jquery.fancybox.css">
    <!-- bootstrap.min -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/bootstrap.min.css">
    <!-- bootstrap.min -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/owl.carousel.css">
    <!-- bootstrap.min -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/slit-slider.css">
    <!-- bootstrap.min -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/animate.css">
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/css/main.css">
    <!-- Messager -->
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
    <!-- Modernizer Script for old Browsers -->
    <script src="${pageContext.request.contextPath}/resources/template/js/modernizr-2.6.2.min.js"></script>



</head>

<body id="body">

<!-- preloader -->
<div id="preloader">
    <div class="loder-box">
        <div class="battery"></div>
    </div>
</div>
<!-- end preloader -->

<!--
Fixed Navigation
==================================== -->
<header id="navigation" class="navbar-inverse navbar-fixed-top animated-header">
    <div class="container">
        <div class="navbar-header">
            <!-- responsive nav button -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- /responsive nav button -->

            <!-- logo -->
            <c:choose>
                <c:when test="${loginMember.name==null}">
                    <h1 class="navbar-brand">
                        <a href="loginUI.jsp">登录</a>
                    </h1>
                </c:when>
                <c:otherwise>
                    <h1 class="navbar-brand">
                        <span>
                        <a href="#">${loginMember.name}</a>&nbsp;
                        <a href="${pageContext.request.contextPath}/member/logout">注销</a></span>
                    </h1>
                </c:otherwise>
            </c:choose>
            <!-- /logo -->
        </div>

        <!-- main nav -->
        <nav class="collapse navbar-collapse navbar-right" role="navigation">
            <ul id="nav" class="nav navbar-nav">
                <li><a href="#body">主页</a></li>
                <li><a href="#service">业务</a></li>
                <li><a href="#portfolio">特色</a></li>
                <li><a href="#social">关于</a></li>
                <li><a href="#contact">点餐</a></li>
                <li><a href="#" id="cart">购物车</a></li>
                <li><a href="#" id="register">注册</a></li>
            </ul>
        </nav>
        <!-- /main nav -->

    </div>
</header>
<!--
End Fixed Navigation
==================================== -->

<main class="site-content" role="main">

    <!--
    Home Slider
    ==================================== -->

    <section id="home-slider">
        <div id="slider" class="sl-slider-wrapper">

            <div class="sl-slider">

                <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">

                    <div class="bg-img bg-img-1"></div>

                    <div class="slide-caption">
                        <div class="caption-content">
                            <h2 class="animated fadeInDown">欢迎光临xx点餐</h2>
                            <span class="animated fadeInDown"></span>
                            <ul class="nav-slide" >
                                <a href="#contact"  class="btn btn-blue btn-effect">进入点餐</a>
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">

                    <div class="bg-img bg-img-2"></div>
                    <div class="slide-caption">
                        <div class="caption-content">
                            <h2>你的满意，就是我们的追求</h2>
                            <span>新鲜 · 美味 · 安全 · 极速 </span>
                            <ul class="nav-slide" >
                                <a href="#contact"  class="btn btn-blue btn-effect">进入点餐</a>
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">

                    <div class="bg-img bg-img-3"></div>
                    <div class="slide-caption">
                        <div class="caption-content">
                            <h2>给我一个信任，还你一个满意</h2>
                            <span>新鲜 · 美味 · 安全 · 极速 </span>
                            <ul class="nav-slide" >
                                <a href="#contact"  class="btn btn-blue btn-effect">进入点餐</a>
                            </ul>
                        </div>
                    </div>

                </div>

            </div><!-- /sl-slider -->

            <!--
            <nav id="nav-arrows" class="nav-arrows">
                <span class="nav-arrow-prev">Previous</span>
                <span class="nav-arrow-next">Next</span>
            </nav>
            -->

            <nav id="nav-arrows" class="nav-arrows hidden-xs hidden-sm visible-md visible-lg">
                <a href="javascript:;" class="sl-prev">
                    <i class="fa fa-angle-left fa-3x"></i>
                </a>
                <a href="javascript:;" class="sl-next">
                    <i class="fa fa-angle-right fa-3x"></i>
                </a>
            </nav>


            <nav id="nav-dots" class="nav-dots visible-xs visible-sm hidden-md hidden-lg">
                <span class="nav-dot-current"></span>
                <span></span>
                <span></span>
            </nav>

        </div><!-- /slider-wrapper -->
    </section>

    <div class="copyrights">Collect from <a href="#" >608</a></div>


    <!-- Service section -->
    <section id="service">
        <div class="container">
            <div class="row">

                <div class="sec-title text-center">
                    <h2 class="wow animated bounceInLeft">业务</h2>
                    <p class="wow animated bounceInRight">主要特点</p>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn">
                    <div class="service-item">
                        <div class="service-icon">
                            <i class="fa fa-home fa-3x"></i>
                        </div>
                        <h3>全国连锁</h3>
                        <p>全国多家分店共同营运，实现随订随到的服务 </p>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.3s">
                    <div class="service-item">
                        <div class="service-icon">
                            <i class="fa fa-tasks fa-3x"></i>
                        </div>
                        <h3>花样菜式</h3>
                        <p>各式各样的菜式，给你多一份不同的选择</p>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.6s">
                    <div class="service-item">
                        <div class="service-icon">
                            <i class="fa fa-clock-o fa-3x"></i>
                        </div>
                        <h3>极速配送</h3>
                        <p>极速配送服务，在极速配送范围的所有订单，均可享受限时送达服务 </p>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.9s">
                    <div class="service-item">
                        <div class="service-icon">
                            <i class="fa fa-heart fa-3x"></i>
                        </div>

                        <h3>用心服务</h3>
                        <p>主动、及时、高效、正规的流程，技能专业、沟通良好的服务素质为客户提供量身定做的服务 </p>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- end Service section -->

    <!-- portfolio section -->
    <section id="portfolio">
        <div class="container">
            <div class="row">

                <div class="sec-title text-center wow animated fadeInDown">
                    <h2>特色菜单</h2>
                    <p>每一款菜色都包含着我们的用心精良</p>
                </div>


                <ul class="project-wrapper wow animated fadeInUp" id="product_all">

                </ul>
                <span class="pager">
                    <div id="pagers" style="width: 480px">
                    </div>
                </span>
            </div>
        </div>
    </section>

    <!-- end portfolio section -->



    <!-- Social section -->
    <section id="social" class="parallax">
        <div class="overlay">
            <div class="container">
                <div class="row">

                    <div class="sec-title text-center white wow animated fadeInDown">
                        <h2>关于我们</h2>
                        <p>精美的烹饪，帮助您获得追随者</p>
                    </div>

                    <ul class="social-button">
                        <li class="wow animated zoomIn"><a href="#"><i class="fa fa-thumbs-up fa-2x"></i></a></li>
                        <li class="wow animated zoomIn" data-wow-delay="0.3s"><a href="#"><i class="fa fa-twitter fa-2x"></i></a></li>
                        <li class="wow animated zoomIn" data-wow-delay="0.6s"><a href="#"><i class="fa fa-dribbble fa-2x"></i></a></li>
                    </ul>

                </div>
            </div>
        </div>
    </section>
    <!-- end Social section -->

    <!-- Contact section -->
    <section id="contact" >
        <div class="container">
            <div class="row">

                <div class="sec-title text-center wow animated fadeInDown">
                    <h2>快速点餐</h2>
                    <p>填写信息</p>
                </div>
                <div class="col-md-7 contact-form wow animated fadeInLeft">
                    <form action="#" id="myForm" novalidate method="post">
                        <div class="input-field">
                            <input type="text" name="name"  required class="form-control" placeholder="填写你的名字...">
                        </div>
                        <div class="input-field">
                            <input type="text" name="phoneNumber" class="form-control" required placeholder="填写你的手机...">
                        </div>
                        <div class="input-field">
                            <input type="email" name="email" class="form-control"  required placeholder="填写你的邮箱...">
                        </div>
                        <div class="input-field">
                            <input type="text" name="subject" class="form-control" placeholder="填写你的地址...">
                        </div>
                        <div class="input-field">
                            <textarea name="message" class="form-control" placeholder="你想要购买的产品以及数量..."></textarea>
                        </div>
                        <button type="submit" id="submit"
                                class="btn btn-blue btn-effect">Send</button>
                    </form>
                </div>

                <div class="col-md-5 wow animated fadeInRight">
                    <address class="contact-details">
                        <h3>联系我们</h3>
                        <p><i class="fa fa-pencil"></i>Phoenix Inc.<span>PO Box 345678</span> <span>Little Lonsdale St, Melbourne </span><span>Australia</span></p><br>
                        <p><i class="fa fa-phone"></i>Phone: (415) 124-5678 </p>
                        <p><i class="fa fa-envelope"></i>website@yourname.com</p>
                    </address>
                </div>

            </div>
        </div>
    </section>
    <!-- end Contact section -->


</main>

<footer id="footer">
    <div class="container">
        <div class="row text-center">
            <div class="footer-content">
                <div class="wow animated fadeInDown">
                    <p>newsletter signup</p>
                    <p>Get Cool Stuff! We hate spam!</p>
                </div>
                <form action="#" method="post" class="subscribe-form wow animated fadeInUp">
                    <div class="input-field">
                        <input type="email" class="subscribe form-control" placeholder="Enter Your Email...">
                        <button type="submit" class="submit-icon">
                            <i class="fa fa-paper-plane fa-lg"></i>
                        </button>
                    </div>
                </form>
                <div class="footer-social">
                    <ul>
                        <li class="wow animated zoomIn"><a href="#"><i class="fa fa-thumbs-up fa-3x"></i></a></li>
                        <li class="wow animated zoomIn" data-wow-delay="0.3s"><a href="#"><i class="fa fa-twitter fa-3x"></i></a></li>
                        <li class="wow animated zoomIn" data-wow-delay="0.6s"><a href="#"><i class="fa fa-skype fa-3x"></i></a></li>
                        <li class="wow animated zoomIn" data-wow-delay="0.9s"><a href="#"><i class="fa fa-dribbble fa-3x"></i></a></li>
                        <li class="wow animated zoomIn" data-wow-delay="1.2s"><a href="#"><i class="fa fa-youtube fa-3x"></i></a></li>
                    </ul>
                </div>

                <p>Copyright &copy; 2014-2015  - Collect from 608</p>
            </div>
        </div>
    </div>
</footer>
<!-- Essential jQuery Plugins
================================================== -->
<!-- Main jQuery -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery-1.11.1.min.js"></script>
<!-- Twitter Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/template/js/bootstrap.min.js"></script>
<!-- Single Page Nav -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.singlePageNav.min.js"></script>
<!-- jquery.fancybox.pack -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.fancybox.pack.js"></script>
<!-- Google Map API -->

<!-- Owl Carousel -->
<script src="${pageContext.request.contextPath}/resources/template/js/owl.carousel.min.js"></script>
<!-- jquery easing -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.easing.min.js"></script>
<!-- Fullscreen slider -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.slitslider.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.ba-cond.min.js"></script>
<!-- onscroll animation -->
<script src="${pageContext.request.contextPath}/resources/template/js/wow.min.js"></script>
<!-- Custom Functions -->
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
<!-- validate -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/pagers/jquery.paginate.js" type="text/javascript"></script>
<!-- messager -->
<script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>

<script>
    $(document).ready(function() {
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
        $("#myForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 5
                },
                phoneNumber: {
                    minlength: 11,
                    maxlength: 11,
                    number: true
                },
                email: {
                    required: true,
                    email: true
                },
                subject: "required",
                message: {
                    required: true
                }

            },
            messages: {
                name: {
                    required: "请填写您的用户名",
                    minlength: "用户名长度不能小于5位"
                },
                email: {
                    required: "请填写您的邮箱",
                    email: "请填写正确的邮箱格式"
                },
                phoneNumber: "请填写正确的手机格式",
                subject: "请填写你的信息",
                message: "请填写你需要订购的物品"
            }
        });
        $('a#register').on('click' , function(){
            window.location.href = "${pageContext.request.contextPath}/member/registerUI" ;
        })
    });
    function list(pages) {
        $("#product_all").empty()
        $.ajax({
            url : "${pageContext.request.contextPath}/pagers/"+pages,
            type : 'get',
            cache: false,
            dataType : 'json',
            async : false,
            success : function(data) {
                var j = 0
                for(var i = 0; i < data.size; i++){
                    $("#product_all").append("<li class=portfolio-item id=product_list"+i+"></li>")
                    if(data.content[i].picture==null){
                        $("#product_list"+i).append("<img alt="+data.content[i].productType.name+" height="+370+" border="+0+" width="+280+" class=img-responsive src="+"/lx/resources/template/img/miss.PNG>")
                    }else{
                        $("#product_list"+i).append("<img alt="+data.content[i].productType.name+" height="+370+" border="+0+" width="+280+" class=img-responsive src="+"/lx/resources/file/product/"+data.content[i].picture+">")
                    }

                    $("#product_list"+i).append("<figcaption class=mask><h3 id=name"+data.content[i].id+">"+data.content[i].name+"</h3><p>"+data.content[i].productType.name+"</p><p align=right id=money"+data.content[i].id+">￥"+data.content[i].money+"</p></figcaption>")
                    $("#product_list"+i).append("<ul class=external><li>" +
                    "<a class=fancybox title="+data.content[i].name+" data-fancybox-group=works href="+"/lx/resources/file/product/"+data.content[i].picture+"><i class='fa fa-search'></i></a></li><li><a href='javascript:void(0)' onclick='link(\""+data.content[i].id+"\");'  id="+data.content[i].id+"><i class='fa fa-link'></i></a></li></ul>")
                }
            },
            error : function() {
                alert("请求失败")
            }
        });

    };
    function link(ids){
         if(${loginMember.name==null}){
             $._messengerDefaults = {
                 extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
             }
             $.globalMessenger().post({  message:"提示：请您先登录,再进行购买",
                 type: "error",
                 showCloseButton: true})
         }else{
             var id = ids
             var name = $('h3#name'+id).text()
             var money = parseFloat($('p#money'+id).text().substring(1)).toFixed(2)
             var number = 1
             var memberProduct = {id:id,name:name,money:money,number:number,total:money}
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
         }
    }
</script>
<c:choose>
    <c:when test="${loginMember.name==null}">
        <script>
            $().ready(function(){
                $._messengerDefaults = {
                    extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"提示：请您先登录",
                    type: "error",
                    showCloseButton: true})
            })
        </script>
    </c:when>
    <c:otherwise>
        <script>
            $().ready(function(){
                $._messengerDefaults = {
                    extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"提示：登录成功",
                    type: "success",
                    showCloseButton: true})
            })
        </script>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${loginMember.name==null}">
        <script>
            $('a#cart').on('click',function(){
                $._messengerDefaults = {
                    extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"提示：请您先登录",
                    type: "error",
                    showCloseButton: true})
            })
        </script>
    </c:when>
    <c:otherwise>
        <script>
            $('a#cart').on('click',function(){
                window.location.href = "${pageContext.request.contextPath}/cart/show/${loginMember.loginName}"
            })
        </script>
    </c:otherwise>
</c:choose>
</body>
</html>
