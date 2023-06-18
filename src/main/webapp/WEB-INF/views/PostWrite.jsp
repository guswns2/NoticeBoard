<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>PostWrite</title>
	
	<link href="${cpt}/resources/css/style.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function Register() {
			if(confirm("글을 등록하시겠습니까?")) {
				let pstTitle = $("#pstTitle").val();
				let pstContent = $("#pstContent").val();
				let pstUser = '${logID}';
				
				$.ajax({
					type : "POST",
					url : "${cpt}/WriteRegi",
					data : {
						pstTitle : pstTitle,
						pstContent : pstContent,
						pstUser : pstUser
					},
					
					success : function(data) {
						alert("글 등록이 완료되었습니다.");
						location.href='${cpt}/';
					},
					error : function(data) {
						alert("글 등록을 실패하였습니다.");
					} 
				})
			}
		}
	</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <h4>PostWrite</h4>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="${cpt}/">Home</a>
	        </li>
	        <li class="nav-item">
	          <c:if test="${logID == null}">
				  <a class="nav-link" href="${cpt}/Login">Login</a>
			  </c:if>
			  <c:if test="${logID != null}">
				  <li class="nav-item">
				  	<a class="nav-link" href="${cpt}/Logout">Logout</a>
				  </li>
				   <li class="nav-item"><a class="nav-link">${logID} 님</a></li>
			  </c:if>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<form>
			<table class="table">
				<thead>
					<tr>
						<th style="min-width:100px">제목</th>
						<td><input id="pstTitle" class="form-control" type="text"></td>
						<th style="min-width:100px">작성자</th>
						<td><input id="pstUser" class="form-control" type="text" value="${logID}" readonly></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan=4 style="text-align:left;"}>내용</th>
					</tr>
					<tr>
						<td colspan=4 style="text-align:left">
							<input id="pstContent" class="form-control" style=" min-height:300px;" type="text" placeholder="내용을 입력해주세요.">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td><button class="btn btn-primary" type="button" onClick="Register()">등록</button></td>
						<td><button class="btn btn-primary" type="reset" onClick="location.href='${cpt}'">취소</button></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>