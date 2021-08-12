<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<font style="color:green">${member.name}</font>님 환영합니다.
<a href="../member/logout">로그아웃</a>
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
				대충만든거
			</h1>
			<a href='./list'>검색창</a><br/>
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
			<th>이름</th>
			
			<th>img</th>
			
			</tr>
			
			<c:if test="${empty list}">
				<tr>
					<td align='center' colspan="5">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="list">
				<tr>
				<td align='center'><a href ="essential?url=${list.url}">${list.mname}</a>
				</td>
				
				<td><img src=${list.img}></td>ㄷㄷ해 머선12구
				
				</tr>
			</c:forEach>
			</table>
		</center>
	</body>
</html>