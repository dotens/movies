<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				
				</tr>
			</c:forEach>
			</table>
		</center>
	</body>
</html>