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
			<form id="wishList" method='post' action='deleteWish2'>
			<input type="hidden" name="id" id="id" value="${member.id}">
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
			<th>제목</th>
			<th>WishList</th>
			</tr>
			
			<c:if test="${empty wishList}">
				<tr>
					<td colspan='2' align='center'>데이터가 하나도 없음</td>
				</tr>
			</c:if>
			
			<c:forEach items="${wishList}" var="wlist" varStatus="status">
				<tr>
				<td align='center'>${wlist.mname}</td>
				<td><button type="submit" type="button" name="mname" id="mname" value="${wlist.mname}">해제하기</button></td>
				</tr>
			</c:forEach>
			</table>
			</form>
		</center>
	</body>
</html>