<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
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
	        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
            <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
            <link rel="stylesheet" href="../resources/css/flaticon.css">
            <link rel="stylesheet" href="../resources/css/slicknav.css">
            <link rel="stylesheet" href="../resources/css/animate.min.css">
            <link rel="stylesheet" href="../resources/css/magnific-popup.css">
            <link rel="stylesheet" href="../resources/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="../resources/css/themify-icons.css">
            <link rel="stylesheet" href="../resources/css/slick.css">
            <link rel="stylesheet" href="../resources/css/nice-select.css">
            <link rel="stylesheet" href="../resources/css/style.css">

            
		<meta charset="utf-8">
		<title>검색결과</title>
		<style>
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

		<center>

			
			<form id="wishList">
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>

	<div id="background">
		<img id = "backimg">
		</div>
		
		<script type="text/javascript">
			showImage('background');
		</script>
			<img id = "introImg" border="0">

	        <div class="favourite-place">
	            <div class="container">
	                <!-- Section Tittle -->
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="section-tittle text-center">
	                        	<font style="color:green"><p class="p">${member.name}님 환영합니다.</p></font>
								<a href="../member/logout"><p class="p">로그아웃</p></a>
								<input type="hidden" name="id" id="id" value="${member.id}">
								<h2><p class="p">검색결과</p></h2>
	                            <span><p class="p">입력된 단어로 검색된 영화입니다</p></span>

	                            <a href='./list' style="color:black" ><p class="p">검색창으로</p></a><br/>
	                        </div>
	                    </div>
	                </div>
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
					<a href='..	/list' style="color:black" ><p class="p">검색창으로</p></a><br/>
				</tr>
				
			</c:if>
			
			</table>
			</form>
			
		</center>

	</body>
</html>