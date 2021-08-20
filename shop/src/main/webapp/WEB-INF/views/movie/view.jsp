<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<jsp:include page="../member/login_check_module.jsp" />
<script>
$(function() {
	$("#btn1").on("click", function() {
		if($("#btn1").text() == "위시리스트 추가하기") {
			const btn1 = document.getElementById('btn1');
			btn1.innerText = '위시리스트 해제하기';
			$.ajax({
				url: "../member/insertWish.json",
				type: "POST",
				data: {id: $("#id").val(), mname: $("#btn1").val()},
				success: function(data) {}
			});
		} else if($("#btn1").text() == "위시리스트 해제하기") {
			const btn1 = document.getElementById('btn1');
			btn1.innerText = '위시리스트 추가하기';
			$.ajax({
				url: "../member/deleteWish.json",
				type: "GET",
				data: {id: $("#id").val(), mname: $("#btn1").val()},
				success: function(data) {}
			});
		}
	});
});
</script>
<!DOCTYPE html>
<html lang="en">
<input type="hidden" name="id" id="id" value="${member.id}">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Heejin's Movie</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/img/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
	rel="stylesheet">


<!-- Bootstrap core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="../resources/assets/css/fontawesome.css">
<link rel="stylesheet" href="../resources/assets/css/templatemo-stand-blog.css">
<link rel="stylesheet" href="../resources/assets/css/owl.css">

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
	background-color: #ffffff;
	border: none;
	border-color: black;
	border-radius: 5px;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	font-weight: bold;
	margin: 4px 4px;
	cursor: pointer;
}
a {
	color: blue;
}
a:hover {
	color: #000000
}
</style>
</head>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="/assets/img/logo/logo2.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- Header -->
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
											<li><a href="../member/info?id=${member.id}"><b>${member.name}</b>님</a></li>
											<li><a href="../member/logout">Sign out</a></li>
											<li><a href="../member/selectWish?id=${member.id}">My
													WishList</a></li>
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

	<!-- Page Content -->
	<!-- Banner Starts Here -->
	<div class="heading-page header-text">
		<section class="page-heading">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="text-content">
							<h2>영화 상세 정보</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
	<section class="blog-posts grid-system">
		<div class="container">
			<div class="row">
				<c:forEach items="${mlist}" var="mlist">
					<div class="col-lg-12">
						<div class="blog-post">
							<div class="blog-thumb">
								<img src="${mlist.IMG}" alt="">
							</div>
							<div class="down-content">
								<a href="post-details.html"><h4>${mlist.mname}</h4></a>
								<ul class="post-info">
									<li><a href="https://movie.naver.com/movie/${mlist.URL}">예매하기</a></li>
									<li>별점: ${mlist.starpoint}</li>
									<li><button class="button" type="button" id="btn1"
											value="${mlist.mname}">위시리스트 추가하기</button></li>
								</ul>
								<p>${mlist.summary}</p>
								<div class="post-options">
									<div class="row">
										<div class="col-6">
											<ul class="post-tags">
											</ul>
										</div>
										<div class="col-6">
											<ul class="post-share">
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:forEach items="${relate}" var="relate">
					<div class="col-lg-12">
						<div class="sidebar-item comments">
							<div class="sidebar-heading">
								<h2>추 천 영 화</h2>
							</div>
							<div class="content">
								<ul>
									<li>
										<div class="author-thumb">
											<a href="essential?url=${relate.rurl}"><img
												src="${relate.rimg}" alt=""></a>
										</div>
										<div class="right-content">
											<p>
												<a href="essential?url=${relate.rurl}" class="a">${relate.rtitle}</a>
											</p>
										</div>
									</li>
								</ul>
							</div>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</section>



	<!-- Bootstrap core JavaScript -->
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Additional Scripts -->
	<script src="../resources/assets/js/custom.js"></script>
	<script src="../resources/assets/js/owl.js"></script>
	<script src="../resources/assets/js/slick.js"></script>
	<script src="../resources/assets/js/isotope.js"></script>
	<script src="../resources/assets/js/accordions.js"></script>


	<script language="text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>
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