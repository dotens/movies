<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
   <script language = "javascript">
      var imgArray = new Array();
      imgArray[0] = "../resources/img/bgimg/bg1.jpg";
      imgArray[1] = "../resources/img/bgimg/bg2.jpg";
      imgArray[2] = "../resources/img/bgimg/bg3.jpg";
      imgArray[3] = "../resources/img/bgimg/bg4.jpg";
      imgArray[4] = "../resources/img/bgimg/bg5.jpg";
      imgArray[5] = "../resources/img/bgimg/bg6.jpg";
      imgArray[6] = "../resources/img/bgimg/bg7.jpg";
      imgArray[7] = "../resources/img/bgimg/bg8.jpg";
      imgArray[8] = "../resources/img/bgimg/bg9.jpg";
      imgArray[9] = "../resources/img/bgimg/bg10.jpg";
      imgArray[10] = "../resources/img/bgimg/bg11.jpg";
      imgArray[11] = "../resources/img/bgimg/bg12.jpg";
      imgArray[12] = "../resources/img/bgimg/bg13.jpg";
      imgArray[13] = "../resources/img/bgimg/bg14.jpg";
      imgArray[14] = "../resources/img/bgimg/bg15.jpg";
      imgArray[15] = "../resources/img/bgimg/bg16.jpg";
      imgArray[16] = "../resources/img/bgimg/bg17.jpg";
      imgArray[17] = "../resources/img/bgimg/bg18.jpg";
      imgArray[18] = "../resources/img/bgimg/bg19.jpg";
      imgArray[19] = "../resources/img/bgimg/bg20.jpg";
      function showImage(){
         var imgNum = Math.round(Math.random()*20);
         var objImg = document.getElementById("backimg");
         objImg.src = imgArray[imgNum];
      }
   </script>
    <head>
       <meta charset="utf-8">
          <meta http-equiv="x-ua-compatible" content="ie=edge">
          <title>Travel HTML-5 Template </title>
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
           
      <style>
         .button {
           position: relative;
           bottom: 3px;
           background-color: #fffc33;
           border: none;
           border-radius: 5px;
           width: 180px;
           height: 55px;
           color: black;
           padding: 15px 15px;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           font-size: 12px;
           margin: 4px 4px;
           cursor: pointer;
         }
         table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
         }
         th, td {
            padding: 5px;
         }
         a { text-decoration:none }
         #backimg {
           position:fixed;
           margin: auto; 
           top: 0%; 
           left: 00%; 
           width: 100%; 
           height: 100%;
           opacity:0.6;
           background-repeat: no-repeat;
           background-size: cover;
           background-position: center;
           
         }
         p 
          {
              margin: 5px;
              padding: 5px 0px;
              text-align: center;
              text-transform: uppercase;
              font-family: "맑은 고딕", sans-serif;
              font-size: 25px;
              font-weight: bold;
          }
         .p 
         {
               
              color: #ffede6;
              text-shadow: 2px 1px 6px rgba(0,0,0,1), 
                          0px -3px 20px rgba(0,0,0,1);
           }


      </style>
      
   </head>

   <body style="text-align:center">
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
                                        <c:choose>
                                   <c:when test="${empty member}">                                                                                                                                
                                            <li><a href="../member/login">Sign in</a></li>
                                            <li><a href="../member/signUp">Sign up</a></li>
                                            </c:when>
                                            <c:otherwise>
                                     <li><a href="../member/info?id=${member.id}"><b>${member.name}</b>님</a></li>
                                     <li><a href="../member/logout">Sign out</a></li>
                                     <li><a href="../member/selectWish?id=${member.id}">My WishList</a></li>
                                 </c:otherwise>
                              </c:choose>
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
      <center>

         
         <form id="wishList">
         <table border='1' cellpadding='7' cellspacing='2' width='50%'>

   <div id="background">
      <img id = "backimg">
      </div>
      <a style="display:scroll;position:fixed;bottom:65px;right:65px;" href="#" title=”맨 위로"><img src="../resources/img/arrowup.png"></a> 
      <script type="text/javascript">
         showImage('background');
      </script>
         <img id = "introImg" border="0">

           <div class="favourite-place">
               <div class="container">
                   <!-- Section Tittle -->

                   <div class="row">
                   <c:forEach items="${list}" var="list">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                           <div class="single-place mb-30">
                               <div class="place-img">
                                   <a href ="essential?url=${list.url}"><img src=${list.img}></a>
                               </div>
                               <div class="place-cap">
                                   <div class="place-cap-top">
                                   
                                       <h3><a href ="essential?url=${list.url}" id="mname"><p class="p">${list.mname}</p></a></h3>
                                   </div>
                               </div>
                           </div>
                       </div>
               </c:forEach>
            </div>
         </div>
      </div>
         <c:if test="${empty list}">
            <tr>
               <td align='center' colspan="5">검색된 결과가 없습니다</td>
               <a href='..   /list' style="color:black" ><p class="p">검색창으로</p></a><br/>
            </tr>
            
         </c:if>
         
         </table>
         </form>
         
      </center>
          <!-- JS here -->
   
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