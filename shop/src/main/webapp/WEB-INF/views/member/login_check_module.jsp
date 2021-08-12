<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<c:if test="${empty member}">
  <script>
	alert("회원 서비스입니다. 로그인을 해주세요.");
  </script>
</c:if>