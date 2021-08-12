<%@ page contentType="text/html;charset=utf-8" import="lhj.shop.domain.FindPwdConst"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  if(${result} == ${FindPwdConst.NO_ID2}) {
	  alert("아이디를 가진 회원이 없습니다.");
	  location.href="findPwd";
  } else if (${result} == ${FindPwdConst.NO_EMAIL}) {
  	  alert("이메일이 일치하지 않습니다.");
	  location.href="findPwd";
  } else {
	  location.href="setPwd";
  }
</script>
