<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/login.css" rel="stylesheet" id="bootstrap-css">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript"> 
	$(function() {
		$("#btn1").on("click", function() {
	  		if($("#id").val().trim() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			  } else if($("#pwd").val().trim() == ""){
				  alert("비밀번호를 입력해주세요.");
				  $("#pwd").focus();
				  return false;
			  }
	 	});
	});
</script>
<div class="container">
    <div class="row">
		<div class="span12">
			<form class="form-horizontal" action="check" method="POST">
			  <fieldset>
			    <div id="legend">
			      <legend class="">Login</legend>
			    </div>
			    <div class="control-group">
			      <!-- Username -->
			      <label class="control-label"  for="id">identification</label>
			      <div class="controls">
			        <input type="text" id="id" name="id" placeholder="" class="input-xlarge">
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Password-->
			      <label class="control-label" for="pwd">Password</label>
			      <div class="controls">
			        <input type="password" id="pwd" name="pwd" placeholder="" class="input-xlarge">
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Button -->
			      <div class="controls">
			        <button type="submit" id="btn1" class="btn btn-success">Login</button>&nbsp;&nbsp;
			        <button type="button" id="btn2" class="btn btn-success" onclick="location.href='signUp'">signUp</button><br/><br/>
			        <button type="button" id="btn3" onclick="location.href='findPwd'">Forget Password</button>
			      </div>
			    </div>
			  </fieldset>
			</form>
		</div>
	</div>
</div>
