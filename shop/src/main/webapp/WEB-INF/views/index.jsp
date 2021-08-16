<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>semi final Index</title>
	</head>
	<body style="text-align:center">
		<h1>
			hj's move controller		
		</h1>
	    <p>
	    <c:choose>
		  <c:when test="${empty member}">
		  	<a href="../member/login">로그인</a>
		  	<a href="../member/signUp">회원가입</a>
		  </c:when>
		  <c:otherwise>
		  	<a href="../member/info?id=${member.id}"><font style="color:green">${member.name}</font></a>님 환영합니다.
		  	<a href="../member/logout">로그아웃</a><br/>
		  	<a href="../member/selectWish?id=${member.id}">나의 위시리스트
		  </c:otherwise>
		</c:choose><br/>
	    <a href="movie/list">검색창</a><br/>
	    <a href="movie/list">검색창</a><br/>
 
	    </p>
	</body>
</html>
