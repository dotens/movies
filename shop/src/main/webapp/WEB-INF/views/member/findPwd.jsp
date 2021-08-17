<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script>
	$(function() {
		$("#btn1").on("click", function() {
			if($("#id").val().trim() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			} else if($("#email").val().trim() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
		});
	});
	
</script>
<div class="container">
    <div class="row">
		<div class="span12">
			<form class="form-horizontal" action="findPwdCheck" method="POST">
			  <fieldset>
			    <div id="legend">
			      <legend class="">Find Password</legend>
			    </div>
			    <div class="control-group">
			      <!-- Username -->
			      <label class="control-label"  for="id">identification</label>
			      <div class="controls">
			        <input type="text" id="id" name="id" placeholder="identification" class="input-xlarge">
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Password-->
			      <label class="control-label" for="email">email</label>
			      <div class="controls">
			        <input type="text" id="email" name="email" placeholder="email" class="input-xlarge">
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Button -->
			      <div class="controls">
			        <button type="submit" id="btn1" class="btn btn-success">Find Password</button>
			      </div>
			    </div>
			  </fieldset>
			</form>
		</div>
	</div>
</div>
