<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
$(function() {
	$("#btn1").on("click", function() {
		if($("#btn1").text() == "추가하기") {
			const btn1 = document.getElementById('btn1');
			btn1.innerText = '해제하기';
			$.ajax({
				url: "../member/insertWish.json",
				type: "POST",
				data: {id: $("#id").val(), mname: $("#btn1").val()},
				success: function(data) {}
			});
		} else if($("#btn1").text() == "해제하기") {
			const btn1 = document.getElementById('btn1');
			btn1.innerText = '추가하기';
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
<font style="color:green">${member.name}</font>님 환영합니다.
<a href="../member/logout">로그아웃</a>
<input type="hidden" name="id" id="id" value="${member.id}">
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="/css/imgSize.css">



		<meta charset="utf-8">
		<title>Title</title>
		<style>
			table, th, td {
			   border: 1px solid black;
			   border-collapse: collapse;
			}
			th, td {
			   padding: 5px;
			}
			a { text-decoration:none }
		</style>
	</head>

	<body style="text-align:center">
		<center>
			<h1>
				영화 상세정보
			</h1>
			<a href='list'>메인으로</a><br/>
		<table border='1' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
			<th id=test >이름</th>
			<th>줄거리</th>
			<th>별점</th>
			<th>리뷰</th>
			<th>예매</th>
			<th>포스터</th>
			<th>WishList</th>
			</tr>
			
			<c:if test="${empty a[0]}">
				<tr>
					<td align='center' colspan="5">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			 <c:forEach items="${a[0]}" var="list" begin="0" end="1">
				<tr>
				<td align='center'>${list.mname}</td>
				<td id=summary>${list.summary}</td>
				<td>${list.starpoint}</td>
				<td>${list.review}</td>
				<td><a href =${list.URL}>예매사이트로</a></td>
				<td><img id=mainPoster src=${list.IMG} ></td>
				<td><button style="width:80px; height:40px" type="button" id="btn1" value="${list.mname}">추가하기</button></td>

				
				
								</tr>
			</c:forEach>
			
		</table>
			<h1>
				관련 영화 추천
			</h1>
		<table border='2' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
				<th>타이틀</th>
				<th>이미지</th>
			</tr>

			
			<c:if test="${empty a[1]}">
				<tr>
					<td align='center' colspan="2">검색된 연관영화가 없습니다</td>
				</tr>
			</c:if>
			<c:forEach items="${a[1]}" var="relate">
				<tr>
				<td align='center'><a href ="essential?url=${relate.rurl}">${relate.rtitle}</a></td>
				<td align='center'><a href ="essential?url=${relate.rurl}"><img src=${relate.rimg}></td>
				</tr>
			</c:forEach>

		</table>
			

		</center>
	</body>
</html>