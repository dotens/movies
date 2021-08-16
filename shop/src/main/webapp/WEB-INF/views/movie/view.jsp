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
				되려무나
			</h1>
			<a href='.../list'>어디로가려나</a><br/>
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
			<th>이름</th>
			<th>줄거리</th>
			<th>별점</th>
			<th>리뷰</th>
			<th>예매</th>
			<th>포스터</th>
			<th>WishList</th>
			</tr>
			
			<c:if test="${empty list}">
				<tr>
					<td align='center' colspan="5">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="list">
				<tr>
				<td align='center'>${list.mname}</td>
				<td>${list.summary}</td>
				<td>${list.starpoint}</td>
				<td>${list.review}</td>
				<td>${list.URL}</td>
				<td><img src=${list.IMG}></td>
				<td><button style="width:80px; height:40px" type="button" id="btn1" value="${list.mname}">추가하기</button></td>
				</tr>
			</c:forEach>
			</table>
		</center>
	</body>
</html>