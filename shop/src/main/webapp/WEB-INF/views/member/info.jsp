<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#delete").on("click", function() {
			if(confirm("탈퇴 하시겠습니까?")) {
				location.href="delete?id=${member.id}";
				alert("탈퇴 완료했습니다.");
			} else {
				return;
			}
		});
	});

</script>
<!DOCTYPE html>
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
<meta charset="utf-8">
<center>
	<font color='gray' size='4' face='휴먼편지체'>
	<hr width='600' size='2' color='gray' noshade>
	<h3>Spring Board ( Spring5 + MyBatis )</h3>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='write.do'>글쓰기</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	</font>
	
	<table border='2' width='600' align='center' noshade>
	<tr>
	<td width='20%' align='center'>Id</td>
	<td>${member.id}</td>
	</tr>
	<tr>
	<td width='20%' align='center'>Name</td>
	<td>${member.name}</td>
	</tr>
	<tr>
	<td align='center'>Email</td>
	<td>${member.email}</td>
	</tr>
	<tr>
	<td align='center'>Phone</td>
	<td>${member.phone}</td>
	</tr>
	</tr>
	</table>
	
	<hr width='600' size='2' color='gray' noshade>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='update?id=${member.id}'>수정</a>
	 &nbsp;&nbsp;| 
	<button type="button" id="delete" value="탈퇴">탈퇴</button>
	 &nbsp;&nbsp;| 
	<a href='../movie/list'>목록</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
</center>
