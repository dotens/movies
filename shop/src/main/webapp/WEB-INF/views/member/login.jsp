<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript"> 
	$(function() {
		$("#btn1").on("click", function() {
	  		if($("#id").val().trim() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			  } else if($("#pwd").val().trim() == ""){
				  alert("비밀번호를 입력해주세요.");
				  $("#pwd").focus();
				  return false;
			  }
	 	});
	});
</script>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Heejin's Movie </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="/assets/css/flaticon.css">
            <link rel="stylesheet" href="/assets/css/slicknav.css">
            <link rel="stylesheet" href="/assets/css/animate.min.css">
            <link rel="stylesheet" href="/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="/assets/css/themify-icons.css">
            <link rel="stylesheet" href="/assets/css/slick.css">
            <link rel="stylesheet" href="/assets/css/nice-select.css">
            <link rel="stylesheet" href="/assets/css/style.css">
   </head>
	<body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/assets/img/logo/logo2.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader End -->
    <header>
    	<br/>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="../"><img src="/assets/img/logo/logo2.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
<br/>
<div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="/assets/img/hero/background.jpg">    
<div class="container">
	<div class="row justify-content-center">
       <div class="col-md-8">
           <div class="card">
               <div class="card-header">Sign in</div>
               <div class="card-body">
                   <form class="form-horizontal" method="post" action="check">
                       <div class="form-group">
                           <label for="id" class="cols-sm-2 control-label">Identification</label>
                           <div class="cols-sm-10">
                               <div class="input-group">
                                   <span class="input-group-addon"><i class="fa fa-user fa-lg" aria-hidden="true"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                   <input type="text" class="form-control" name="id" id="id" placeholder="Enter your Identification" />
                               </div>
                           </div>
                       </div>
                       <div class="form-group">
                           <label for="pwd" class="cols-sm-2 control-label">Password</label>
                           <div class="cols-sm-10">
                               <div class="input-group">
                                   <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                   <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter your Password" />
                               </div>
                           </div>
                       </div>
                       <div class="form-group">
                           <button type="submit" id="btn1" class="btn btn-primary btn-lg btn-block login-button">Sign in</button>
                       </div>
                       <div class="form-group">
                           <button type="button" id="btn2" onclick="location.href='signUp'" class="btn btn-primary btn-lg btn-block login-button" style="background-color:green">Sign up</button>
                       </div>
                       <div class="login-signup">
                           <button type="button" id="btn3" onclick="location.href='findPwd'" class="btn btn-primary btn-lg btn-block login-button" style="background-color:green">Forget password</button>
                       </div>
                   </form>
               </div>
           </div>
       </div>
    </div>
</div>
</div>
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/assets/js/vendor/modernizr-3.5.0.min.js"></script>
        
		<!-- Jquery, Popper, Bootstrap -->
		<script src="/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="/assets/js/popper.min.js"></script>
        <script src="/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="/assets/js/owl.carousel.min.js"></script>
        <script src="/assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="/assets/js/wow.min.js"></script>
		<script src="/assets/js/animated.headline.js"></script>
        <script src="/assets/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="/assets/js/jquery.scrollUp.min.js"></script>
        <script src="/assets/js/jquery.nice-select.min.js"></script>
		<script src="/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="/assets/js/contact.js"></script>
        <script src="/assets/js/jquery.form.js"></script>
        <script src="/assets/js/jquery.validate.min.js"></script>
        <script src="/assets/js/mail-script.js"></script>
        <script src="/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="/assets/js/plugins.js"></script>
        <script src="/assets/js/main.js"></script>
</body>
</html>
