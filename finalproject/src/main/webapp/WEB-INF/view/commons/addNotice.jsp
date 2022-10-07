<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2유2김</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
	<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		<!-- 파일 등록 JS -->
		$(document).ready(function(){
			<!-- 이미지 파일만 업로드 가능 -->

			document.querySelector('#fileData').addEventListener('change',function (ev) {
				let fileName = this.value;
				if(!checkExtension(fileName)){
					alert("이미지 파일만 업로드 가능합니다.(jpeg, jpg, png, gif, bmp)");
					this.value = '';
					return;
				}
			})

			function checkExtension(fileName){
				let fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
				if(fileName.match(fileForm)){
					return true;
				}
				return false;
			}

			$('#addBtn').click(function(){

				if($('#noticeTitle').val() == ''){
					alert('제목을 입력하세요');
				} else if($('#noticeContent').val() == ''){
					alert('내용을 입력하세요');
				} else{
					addNoticeForm.submit();
				}

			});

		});
	</script>
</head>
<body>
<!-- header(로고, 네비게이션바) -->
<div>
	<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
	<br>
	<br>
	<br>
</div><!-- header END -->

<!-- 총 관리자만 공지사항 등록 가능 -->
<sec:authentication property="principal" var="member"/>

<!-- 공지사항 등록폼 -->
<div class="container">
	<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/addNotice" id="addNoticeForm">
		<h2 style="text-align:center;">공지사항 등록</h2>
		<br>
		
		<table class="table table-bordered">
			<tr>
				<td style="width: 10%;">제목</td>
				<td style="width: 90%;"><input type="text" id="noticeTitle" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" id="employeeId" name="employeeId" value="${member.memberId}" readonly></td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td>
					<div id="fileSection"><input id="fileData" type="file" name="multiList" class="multiList"></div>
				</td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="130" id="noticeContent" name="noticeContent"></textarea></td>
			</tr>
		</table>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList/" style="float:right; margin-left:10px">돌아가기</a>
		<button class="btn btn-primary" type="button" id="addBtn" style="float:right;">등록하기</button>
	</form>
</div>
<!-- 공지사항 추가폼 END -->
	<br>
	<br>
	<br>	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<!-- footer -->
<div>
	<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
</div><!-- footer END -->
</body>
</html>