<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/resource/inc/header.jsp"></c:import>
	</div>
	
	<div class="container">
	<h1 style="text-align:center;">강사리스트</h1>
	<br>
	
	<table class="table table-bordered" style="text-align:center;">
		<tr>
			<th>강사이름</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>강좌이름</th>
		</tr>
		<c:forEach var="i" items="${instrutorList}">
			<tr>
				<td><a
					href="${pageContext.request.contextPath}/instrutorOne?memberNo=${i.memberNo}">${i.memberName}</a></td>
				<td>${i.memberGender}</td>
				<td>${i.memberPhone}</td>
				<td>${i.memberEmail}</td>
				<td>${i.lectureName}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
	
	<div>
	<%-- 페이지네이션 --%>
	<ul class="pagination justify-content-center my-2 mb-2" >
		<%-- 이전 --%>
		<c:if test="${pageNation.startPage ne 1}">
			<li class="page-item"><a class="page-link"
				href="${pageNation.path}?current=${pageNation.startPage-1}"> 이전
			</a></li>
		</c:if>
		<%-- 페이지넘버 --%>
		<c:forEach begin="${pageNation.startPage}" end="${pageNation.endPage}"
			varStatus="status">
			<c:if test="${pageNation.currentPage eq status.index}">
				<li class="page-item active" ><a class="page-link">${status.index}
				</a></li>
			</c:if>
			<c:if test="${pageNation.currentPage ne status.index}">
				<li class="page-item"><a class="page-link"
					href="${pageNation.path}?current=${status.index}">${status.index}
				</a></li>
			</c:if>
		</c:forEach>
		<%-- 다음버튼 --%>
		<c:if test="${pageNation.endPage ne pageNation.lastPage}">
			<li class="page-item"><a class="page-link"
				href="${pageNation.path}?current=${pageNation.endPage+1}">다음</a></li>
		</c:if>
	</ul>
	</div>
	<c:if test="${check eq 'insert'}">
		<script>
			alert('등록성공');
		</script>
	</c:if>

</body>
</html>