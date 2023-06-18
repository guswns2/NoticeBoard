<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<c:set var="cpt">${pageContext.request.contextPath}</c:set>


<html>
<head>
	
	<title>NoticeBoard</title>
	
	<link href="${cpt}/resources/css/style.css" rel="stylesheet">
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
	<script>
		function SelContent(pstNum){
			location.href='${cpt}/ViewWrite?pstNum='+pstNum;
		}
		
		function PostWrite() {
			if(${logID==null}) {
				alert("로그인 후 이용할 수 있습니다.");
			}
			else {
				location.href='${cpt}/PostWrite';
			}
		}
	</script>
	
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <h4>NoticeBoard</h4>
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
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td><c:out value="${status.count}" /></td>
						<td><a class="nav-link" href="#" onClick="SelContent(${list.pstNum})">${list.pstTitle}</a></td>
						<td>${list.pstUser}</td>
						<td><fmt:formatDate value="${list.pstTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
						<td>${list.pstView}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan=5><button class="btn btn-primary" type="button" onClick="PostWrite()">글쓰기</button></td>		
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
