<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript">
  	$(function() {
  		$("#btn1").on("click", function() {
	  		if($("#id").val().trim() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			} else if($("#name").val().trim() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#name").focus();
				return false;
			} else if($("#email").val().trim() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#email").focus();
				return false;
			} else if($("#phone").val().trim() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			} else if($("#pwd").val().trim() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
	  		$.ajax({
  				url: "../member/overlap.json",
  				type: "POST",
  				data: {id:$("#id").val()},
  				success: function(data) {
  					if(data == true) {
  						alert("회원가입을 환영합니다. 로그인 해주세요.");
  					} else {
  						alert("이미 사용된 아이디 입니다.");
  						location.href = "signUp";
  					}
  				}
  			});
	  	});
  		
  		$("#name").on("click", function() {
  			$.ajax({
  				url: "../member/overlap.json",
  				type: "POST",
  				data: {id:$("#id").val()},
  				success: function(data) {
  					if(data == true) {
  						alert("사용 가능한 아이디 입니다.");
  					} else {
  						alert("이미 사용된 아이디 입니다.");
  					}
  				}
  			});
	  	});
  	});
</script>

<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">SignUp</div>
                            <div class="card-body">

                                <form class="form-horizontal" method="post" action="signUp">

                                    <div class="form-group">
                                        <label for="id" class="cols-sm-2 control-label">Your Identification</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="id" id="id" placeholder="Enter your Identification" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="name" class="cols-sm-2 control-label">Your Name</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="Enter your Name" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="email" id="email" placeholder="Enter your Email" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone" class="cols-sm-2 control-label">Your Phone</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter your Phone" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" class="cols-sm-2 control-label">Your Password</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter your Password" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button id="btn1" type="submit" class="btn btn-primary btn-lg btn-block login-button">SignUp</button>
                                    </div>
                                    <div class="login-signup">
                                        <a href="login">Login</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>