<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Login</title>
	
	<link href="${cpt}/resources/css/style.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<style>
	</style>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function Login() {
			let user_ID = $("#id").val();
			let user_PW = $("#pw").val();
			
			$.ajax({
				type : "POST",
				url : "${cpt}/LoginTry",
				data : {
					user_ID : user_ID,
					user_PW : user_PW
				},
				
				success : function(data) {
					if(data != 0){
						location.href="${cpt}/";	
					}
					else {
						alert("아이디 또는 비밀번호가 일치하지 않습니다.")
					}
				},
				error : function(data) {
					alert("로그인 실패");
				} 
			})
		}
	</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <h4>Login</h4>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="${cpt}/">Home</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<form>
		  <div class="mb-3">
		    <label class="form-label">ID</label>
		    <input id="id" type="text" class="form-control">
		  </div>
		  <div class="mb-3">
		    <label class="form-label">Password</label>
		    <input id="pw" type="password" class="form-control" >
		  </div>
		  <button class="btn btn-primary" type="button" onClick="Login()">Login</button>
		  <button class="btn btn-primary" type="reset" onClick="location.href='${cpt}/'">Cancel</button>
		</form>
	</div>
</body>
</html>