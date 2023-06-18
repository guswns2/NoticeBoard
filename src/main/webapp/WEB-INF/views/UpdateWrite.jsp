<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>UpdateWrite</title>
	
	<link href="${cpt}/resources/css/style.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function Update() {
			let pstNum = ${view.pstNum};
			let pstTitle = $("#pstTitle").val();
			let pstContent = $("#pstContent").val();
			
			$.ajax({
				type : "POST",
				url : "/noticeboard/UpdateRegi",
				data : {
					pstNum : pstNum,
					pstTitle : pstTitle,
					pstContent : pstContent,
				},
				
				success : function(data) {
					alert("글 수정이 완료되었습니다.");
					location.href="${cpt}/";
				},
				error : function(data) {
					alert("글 수정을 실패하였습니다.");
				} 
			})
		}
	</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <h4>UpdateWrite</h4>
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
						<td><input id="pstTitle" class="form-control" type="text" value="${view.pstTitle}"></td>
						<th style="min-width:100px">작성자</th>
						<td><input class="form-control" type="text" value="${view.pstUser}" readonly></td>
						<th style="min-width:150px">작성일자</th>
						<td><fmt:formatDate value="${view.pstTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
						<th style="min-width:100px">조회수</th>
						<td>${view.pstView}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan=8 style="text-align:left;"}>내용</th>
					</tr>
					<tr>
						<td colspan=8>
							<input id="pstContent" class="form-control" style="width:100%; min-height:300px;" type="text" value="${view.pstContent}">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=4><button class="btn btn-primary" type="button" onClick="Update()">수정</button></td>
						<td colspan=4><button class="btn btn-primary" type="reset" onClick="location.href='${cpt}/'">취소</button></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>