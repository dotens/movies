<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	$(function() {
		$("#submit").on("click", function() {
			if($("#pwd").val().trim() == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
		});
	});
</script>
<!DOCTYPE html>
<html>
<head>
	<title> Spring Board </title>
	<meta charset="utf-8">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	    function f(){
	    	input.email.value = "";
	    	input.subject.value = "";
	    	//input.content.innerText = "";
	    	$("#ta").text("");
	    	
	    	input.email.focus();
	    }
	</script>
</head>
<body>
<center>
<font color='gray' size='4' face='휴먼편지체'>
<hr width='600' size='2' color='gray' noshade>
<h3> Spring Board ( Spring5 + MyBatis )</h3>
</font>
<font color='gray' size='4' face='휴먼편지체'>
<a href='../movie/list'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='write.do'>글쓰기</a><br/>
</font>
<hr width='600' size='2' color='gray' noshade>
</center>

<form name='input' method='post' action='update'>
<input type="hidden" name="id" value="${member.id}">
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
<tr>
   <td width='20%' align='center' >Name</td>
   <td>
      <input id="name" name='name' readonly value='${member.name}'/>
   </td>
</tr>

<tr>
	<td align='center'>Email</td>
	<td><input id="email" name='email' value='${member.email}'/></td>
</tr>

<tr>
	<td align='center'>Phone</td>
	<td><input id="phone" name='phone' value='${member.phone}'/></td>
</tr>

<tr>
	<td align='center'>Password</td>
	<td><input type="password" id="pwd" name='pwd' value='${member.pwd}'/></td>
</tr>

<tr>
	 <td colspan='2' align='center'>
		<input type='submit' id="submit" value='수정'>
		<input type="button" value="다시입력" onclick="f()">
	 </td>
</tr>

</table>
<hr width="600" size="2" color="gray" noshade>
</form>
</body>
</html>

