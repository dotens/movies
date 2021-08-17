<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<font style="color:green">${member.name}</font>님 환영합니다.
<a href="../member/logout">로그아웃</a>
<input type="hidden" name="id" id="id" value="${member.id}">

<!DOCTYPE html>
<html>
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
			.favourite-place{
			    width: 100vw;
			    height: 100vh;
			    background: url("../resources/img/back.jpg");
			    background-size: 100% 100%;
    			background-position: center;
    			
			}
			.favourite-place::before{
	        content: "";
	        opacity: 0.1;
	        position: absolute;
	        top: 0px;
	        left: 0px;
	        right: 0px;
	        bottom: 0px;
	        background-color: #fff;
	    }


출처: https://ddorang-d.tistory.com/89 [도라미도라미]
		</style>
		
	</head>

	<body style="text-align:center">
		<center>
			<a href='./list' style="color:black" >검색창으로</a><br/>
			<form id="wishList">
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>
        <div class="favourite-place">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>입력된 단어로 검색된 영화입니다</span>
                            <h2>검색결과</h2>
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
                                    <h3><a href ="essential?url=${list.url}" id="mname">${list.mname}</a></h3>
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
				</tr>
				
			</c:if>
			
			</table>
			</form>
			<a href='./list' style="color:black" >검색창으로</a><br/>
		</center>
	</body>
</html>