<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>ViewWrite</title>
	
	<link href="${cpt}/resources/css/style.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
	<script>
		// 수정 페이지로 이동
		function GoUpWrite(pstNum){
			location.href='${cpt}/UpdateWrite?pstNum='+pstNum;
		}
		
		// 게시글 삭제
		function Delete(){
			if(confirm("글을 삭제하시겠습니까?")){
				let pstNum = ${view.pstNum};
				
				$.ajax({
					type : "POST",
					url : "${cpt}/DeleteWrite",
					data : {
						pstNum : pstNum,
					},
					
					success : function(data) {
						alert("글 삭제가 완료되었습니다.");
						location.href='${cpt}/';
					},
					error : function(data) {
						alert("글 삭제를 실패하였습니다.")
					}
				})
			}
		}
		
		// 댓글 등록
		function PostCmt(){
			if(confirm("댓글을 등록하시겠습니까?")){
				$.ajax({
					type : "POST",
					url : "${cpt}/PostCmt",
					data : {
						pstNum : ${view.pstNum},
						cmtUser : '${logID}',
						cmtContent : $("#cmtContent").val()
					},
					
					success : function(data) {
						alert("댓글 등록이 완료되었습니다.");
						location.reload();
					},
					error : function(data) {
						alert("댓글 등록을 실패하였습니다.");
					}
				})
			}
		}
		
		// 댓글 삭제
		function DeleteCmt(cmtNum) {
			if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					type : "POST",
					url : "${cpt}/DeleteCmt",
					data : {
						cmtNum : cmtNum,
					},
					
					success : function(data) {
						alert("댓글 삭제가 완료되었습니다.");
						location.reload();
					},
					error : function(data) {
						alert("댓글 삭제를 실패하였습니다.");
					}
				})
			}
		}
		
		// 댓글 수정
		function UpdateCmt(cmtNum) {
			if(confirm("댓글을 수정하시겠습니까?")){
				$.ajax({
					type : "POST",
					url : "${cpt}/UpdateCmt",
					data : {
						cmtNum : cmtNum,
						cmtContent : $('#updContent'+cmtNum).val()
					},
					
					success : function(data) {
						alert("댓글 수정이 완료되었습니다.");
						location.reload();
					},
					error : function(data) {
						alert("댓글 수정을 실패하였습니다.");
					}
				})
			}
		}
		
		// 답글창 열기
		function displayOn(cmtNum) {
			let cmtTr = document.getElementById("cmtTr"+cmtNum);
			let cmtTd = document.getElementById("cmtTd"+cmtNum);
			
			if(cmtTr.style.display=='none') {
				cmtTr.style.display='table-row';
			}
			else {
				cmtTr.style.display='none';
			}
		}
		
		// 대댓글 달기
		function PostCCmt(cmtNum, forNum) {
			let pstCCmt = document.getElementById("pstCCmt"+cmtNum);
			
			if(confirm("답글을 등록하시겠습니까?")){
				$.ajax({
					type: "POST",
					url: "${cpt}/PostCCmt",
					data: {
						pstNum: ${view.pstNum},
						forNum: forNum,
						cmtDepth: 1,
						cmtUser: '${logID}',
						cmtContent: pstCCmt.value
					},
					
					success: function(data) {
						alert("답글 등록이 완료되었습니다.");
						location.reload();
					},
					error: function(data) {
						alert("답글 등록을 실패하였습니다.");
					}
				})	
			}
			
		}
	</script>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <h4>ViewWrite</h4>
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
				<!-- 게시글 내용 -->
				<thead>
					<tr>
						<th style="min-width:100px">제목</th>
						<td><input class="form-control" type="text" value="${view.pstTitle}" readonly></td>
						<th style="min-width:100px">작성자</th>
						<td><input class="form-control" type="text" value="${view.pstUser}" readonly></td>
						<th style="min-width:150px">작성일자</th>
						<td colspan=2><fmt:formatDate value="${view.pstTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
						<th style="min-width:100px">조회수</th>
						<td>${view.pstView}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan=9 style="text-align:left;"}>내용</th>
					</tr>
					<tr>
						<td colspan=9 style="text-align:left">
							<input class="form-control" style=" min-height:300px;" type="text" value="${view.pstContent}" readonly>
						</td>
					</tr>
					<tr>
						<c:set var="logID" value="${logID}" />
						<c:set var="pstUser" value="${view.pstUser}" />
						<c:if test="${logID eq pstUser}">
							<td colspan=2><button class="btn btn-primary" type="button" onClick="GoUpWrite(${view.pstNum})">수정</button></td>
							<td colspan=2><button class="btn btn-primary" type="button" onClick="Delete()">삭제</button></td>
							<td colspan=5><button class="btn btn-primary" style="text-align:left" type="button" onClick="location.href='${cpt}/'">목록</button></td>
						</c:if>
						<c:if test="${logID ne pstUser}">
							<td colspan=9><button class="btn btn-primary" style="text-align:left" type="button" onClick="location.href='${cpt}/'">목록</button></td>
						</c:if>
					</tr>
				</tbody>
				
				<!-- 댓글 -->
				<tfoot>
					<tr>
						<th colspan=1>댓글</th>
						<td colspan=7><input id="cmtContent" class="form-control" type="text" /></td>
						<td colspan=1><a href="#" onClick="PostCmt()">등록</a></td>
					</tr>
					<tr>
						<c:forEach items="${cmtList}" var="cmtDto">
							<!-- 원본 댓글 -->
							<c:if test="${cmtDto.forNum eq 0 }">
								<tr>
									<!-- 로그인한 사람이 작성한 댓글 -->
									<c:if test="${cmtDto.cmtUser eq logID}">
										<td colspan=1>${cmtDto.cmtUser}</td>
										<td colspan=1></td>
										<td colspan=4><input class="form-control" type="text" value="${cmtDto.cmtContent}" readonly></td>
										<td colspan=1><fmt:formatDate value="${cmtDto.cmtTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
										<td colspan=1>
											<a href="#" onClick="displayOn(${cmtDto.cmtNum})">답글 달기</a>
										</td>
										<td colspan=1>
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal${cmtDto.cmtNum}">수정</button>
											<button type="button" class="btn btn-danger" onClick="DeleteCmt(${cmtDto.cmtNum})">삭제</button>
											<!-- Modal -->
											<div class="modal fade" id="Modal${cmtDto.cmtNum}" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h1 class="modal-title fs-5" id="ModalLabel">댓글 수정</h1>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        <input id="updContent${cmtDto.cmtNum}" class="form-control" type="textarea" value="${cmtDto.cmtContent}"/>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-primary" onClick="UpdateCmt(${cmtDto.cmtNum})">수정</button>
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											      </div>
											    </div>
											  </div>
											</div>
										</td>
									</c:if>
									<!-- 로그인한 사람이 작성하지 않은 댓글 -->
									<c:if test="${cmtDto.cmtUser ne logID}">
										<td colspan=1>${cmtDto.cmtUser}</td>
										<td colspan=1></td>
										<td colspan=4><input class="form-control" type="text" value="${cmtDto.cmtContent}" readonly></td>
										<td colspan=1><fmt:formatDate value="${cmtDto.cmtTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
										<td colspan=1><a href="#" onClick="displayOn(${cmtDto.cmtNum})">답글 달기</a></td>
										<td colspan=1></td>
									</c:if>
								</tr>
								<!-- 답글 달기 -->
								<tr id="cmtTr${cmtDto.cmtNum}" style="display:none;" >
									<td colspan=1 id="cmtTd${cmtDto.cmtNum}">↳ ${logID}</td>
									<td colspan=1></td>
									<td colspan=4><input id="pstCCmt${cmtDto.cmtNum}" class="form-control" type="text"  value="@${cmtDto.cmtUser} " /></td>
									<td colspan=2></td>
									<td colspan=1>
										<a href="#" onClick="PostCCmt(${cmtDto.cmtNum}, ${cmtDto.cmtNum})">등록</a>
										<a href="#" onClick="displayOn(${cmtDto.cmtNum})">취소</a>
									</td>
								</tr>
								
								<!-- 대댓글 -->
								<c:forEach items="${cmtList}" var="cmtDto2">
									<c:if test="${cmtDto2.forNum eq cmtDto.cmtNum}">
										<tr>
											<!-- 로그인한 사람이 작성한 대댓글 -->
											<c:if test="${cmtDto2.cmtUser eq logID}">
												<td colspan=2>↳ ${cmtDto2.cmtUser}</td>
												<td colspan=4><input class="form-control" type="text" value="${cmtDto2.cmtContent}" readonly></td>
												<td colspan=1><fmt:formatDate value="${cmtDto2.cmtTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
												<td colspan=1><a href="#" onClick="displayOn(${cmtDto2.cmtNum})">답글 달기</a></td>
												<td colspan=1>
													<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal2${cmtDto2.cmtNum}">수정</button>
													<button type="button" class="btn btn-danger" onClick="DeleteCmt(${cmtDto2.cmtNum})">삭제</button>
													<!-- Modal -->
													<div class="modal fade" id="Modal2${cmtDto2.cmtNum}" tabindex="-1" aria-labelledby="Modal2Label" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h1 class="modal-title fs-5" id="Modal2Label">댓글 수정</h1>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													        <input id="updContent${cmtDto2.cmtNum}" class="form-control" type="textarea" value="${cmtDto2.cmtContent}"/>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary" onClick="UpdateCmt(${cmtDto2.cmtNum})">수정</button>
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
													      </div>
													    </div>
													  </div>
													</div>
												</td>
											</c:if>
											<!-- 로그인한 사람이 작성하지 않은 댓글 -->
											<c:if test="${cmtDto2.cmtUser ne logID}">
												<td colspan=2>↳ ${cmtDto2.cmtUser}</td>
												<td colspan=4><input class="form-control" type="text" value="${cmtDto2.cmtContent}" readonly></td>
												<td colspan=1><fmt:formatDate value="${cmtDto2.cmtTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
												<td colspan=1><a href="#" onClick="displayOn(${cmtDto2.cmtNum})">답글 달기</a></td>
												<td colspan=1></td>
											</c:if>
										</tr>
										<!-- 답글 달기 -->
										<tr id="cmtTr${cmtDto2.cmtNum}" style="display:none;">
											<td colspan=2 style="text-align:right" id="cmtTd${cmtDto2.cmtNum}">↳ ${logID}</td>
											<td colspan=4><input id="pstCCmt${cmtDto2.cmtNum}" class="form-control" type="text" value="@${cmtDto2.cmtUser} "/></td>
											<td colspan=2></td>																			
											<td colspan=1>
												<a href="#" onClick="PostCCmt(${cmtDto2.cmtNum}, ${cmtDto.cmtNum})">등록</a>
												<a href="#" onClick="displayOn(${cmtDto2.cmtNum})">취소</a>
											</td>
										</tr>
									</c:if>
									
								</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	
	
	
</body>

</html>