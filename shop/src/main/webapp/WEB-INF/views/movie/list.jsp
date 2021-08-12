<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
  <c:when test="${empty member}">
  	<a href="../member/login">로그인</a>
  	<a href="../member/signUp">회원가입</a>
  </c:when>
  <c:otherwise>
  	<font style="color:green">${member.name}</font>님 환영합니다.
  	<a href="../member/logout">로그아웃</a>
  </c:otherwise>
</c:choose>
<form action="search"method="post">
		<select name="catgo">
        <option value="NAVER">네이버</option>
        <option value="CGV">CGV</option>
        <!--  <option value="content">내용</option>-->
     	</select>
      <input type="text" name="mname" size="40" required="required" /> <button>검색</button>
		</form> 
		
		
