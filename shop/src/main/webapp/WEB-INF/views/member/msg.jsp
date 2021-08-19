<%@ page contentType="text/html;charset=utf-8" import="lhj.shop.domain.MemberConst"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	if(${result} == ${MemberConst.NO_ID}) {
		alert("아이디를 가진 회원이 없습니다.");
		location.href="login";
	} else if(${result} == ${MemberConst.NO_PWD}) {
		alert("비밀번호가 일치하지 않습니다.");
		location.href="login";
	} else {
		location.href="../";
	}
</script>