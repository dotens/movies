<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script>
	$(function() {
		$("#btn1").on("click", function(){
			if($("#pwd").val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				return false;
			} else if($("#pwd2").val().trim() == "") {
				alert("비밀번호 확인을 해주세요");
				$("#pwd2").focus();
				return false;
			} else if($("#pwd").val().trim() != $("#pwd2").val().trim()) {
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
				return false;
			} else {
				alert("비밀번호를 변경했습니다.");
			}
		});
	});
</script>
<div class="container">
    <div class="row">
		<div class="span12">
			<form class="form-horizontal" action='setPwd' method="POST">
			  <fieldset>
			    <div id="legend">
			      <legend class="">Set Password</legend>
			    </div>
			    <div class="control-group">
			      <!-- Password-->
			      <label class="control-label" for="pwd">password</label>
			      <div class="controls">
			        <input type="password" id="pwd" name="pwd" placeholder="" class="input-xlarge">
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Password-->
			      <label class="control-label" for="pwd2">password confirm</label>
			      <div class="controls">
			        <input type="password" id="pwd2" name="pwd2" placeholder="" class="input-xlarge">
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Button -->
			      <div class="controls">
			        <button type="submit" id="btn1" class="btn btn-success">Set Password</button>
			      </div>
			    </div>
			  </fieldset>
			</form>
		</div>
	</div>
</div>
