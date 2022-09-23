<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2유2김</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/mainImg/favicon.png">
<script type="text/javascript" src="/WEB-INF/resource/inc/cm.js"></script>
</head>
<body>
	<!-- header(로고, 네비게이션바) -->
	<div>
		<c:import url="/WEB-INF/resource/inc/header.jsp"></c:import>
		<br>
		<br>
		<br>
	</div>
	<!-- 총 관리자만 강좌 추가 가능 -->
	<div class="container">
	<h1 style="text-align:center;">강좌 상세보기</h1>
	<br>

	<form action="${pageContext.request.contextPath}/cartList?lectureNo=${lectureOne.lectureNo}&memberId=yoomisun" method="get">
	<table class="table table-bordered" style="text-align:center; vertical-align:middle;">
		<tr> 
			<td>강좌번호</td>
			<td>${lectureOne.lectureNo} </td>
		</tr>
		<tr> 
			<td>강좌명</td>
			<td>
				<c:choose >
					<c:when test="${lectureOne.lectureName eq '필라테스'}">
						<a href="${pageContext.request.contextPath}/pilates" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a> 
					</c:when>
					<c:when test="${lectureOne.lectureName eq '수영'}">
						<a href="${pageContext.request.contextPath}/swimming" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a> 
					</c:when>
					<c:when test="${lectureOne.lectureName eq '테니스'}">
						<a href="${pageContext.request.contextPath}/tennis" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a> 
					</c:when>
					<c:when test="${lectureOne.lectureName eq '탁구'}">
						<a href="${pageContext.request.contextPath}/pingpong" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a>  
					</c:when>
					<c:when test="${lectureOne.lectureName eq '에어로빅'}">
						<a href="${pageContext.request.contextPath}/aerobics" class="btn btn-primary" style="width:100px;">${lectureOne.lectureName}</a>  
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>강좌요일</td>
			<td>${lectureOne.lectureDay}</td>
		</tr>
		<tr> 
			<td>강사이름</td>
			<td>${lectureOne.memberName}</td>
		</tr>
		<tr> 
			<td>성별</td>
			<td>${lectureOne.memberGender}</td>
		</tr>
		<tr> 
			<td>장소번호</td>
			<td>${lectureOne.locationNo}</td>
		</tr>
		<tr> 
			<td>수강정원</td>
			<td>${lectureOne.lectureLimited}</td>
		</tr>
		<tr> 
			<td>수업시간</td>
			<td>${lectureOne.lectureTime}</td>
		</tr>
		<tr> 
			<td>강의금액</td>
			<td>${lectureOne.lecturePrice}</td>
		</tr>
		<tr> 
			<td>개강일</td>
			<td>${lectureOne.lectureStartDate}</td>
		</tr>
		<tr> 
			<td>종강일</td>
			<td>${lectureOne.lectureEndDate}</td>
		</tr>
	</table>
		
		<button type="button" onclick="javascript:btn()" name="cart" id="cart" class="btn btn-primary" style="width:100px; float:right;" >장바구니</button>
		<a href="${pageContext.request.contextPath}/lectureList" class="btn btn-primary" style="width:100px; float:right; margin-right:10px; ">강좌목록</a>
		
		<!-- 관리자만 수정,삭제 가능버튼 보임 -->
		<a href="${pageContext.request.contextPath}/removeLecture?lectureNo=${lectureOne.lectureNo}" class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌삭제</a>
		<a href="${pageContext.request.contextPath}/modifyLecture?lectureNo=${lectureOne.lectureNo}" 
			class="btn btn-primary" style="width:100px; float:right; margin-right:10px;">강좌수정</a>
	</form>
	</div>

	<br>
	<br>
	<br>
	<br>


	<!-- 리뷰 -->
	<!-- 리뷰 자신이 작성한 것만 수정, 삭제 가능(수강:아이디와 로그인한 아이디가 일치하면 수정, 삭제 가능) / 관리자는 모든 리뷰 삭제 가능  -->
	
	<div class="container">
    <div>
        <h4 class="fw-bold fs-4"  style="text-align:center;">리뷰</h4>
    </div>
    
    <br>
    
    <!-- 리뷰 입력 폼 -->
    <div>
		<form action="${pageContext.request.contextPath}/reviewInsert" method="get">
           <%--  <c:if test="${sessionScope.loginMember ne null}"> --%>
            <textarea class="form-control" placeholder="리뷰를 입력해주세요" name="reviewContent" id="reviewContent"
                      style="height: 100px; resize: none;"></textarea>
           <%--  </c:if> --%>
            <%-- <c:if test="${sessionScope.loginMember eq null}"> --%>
               <!--  <label for="reviewContent">댓글을 작성하려면, 로그인 해주세요</label> -->
            <%-- </c:if> --%>
	       <%--  <c:if test="${sessionScope.loginMember ne null}"> --%>
	            <button type="button" id="reviewInsertBtn" class="btn btn-primary btn-sm">등록</button>
	      <%--   </c:if> --%>
    	</form>
    </div>
    
    <br>
    <br>
    
    <!-- 리뷰 리스트 -->
    <div class="container px-5 my-4" >
    	<form action="${pageContext.request.contextPath}/reviewUpdate?courseNo=${review.courseNo}" method="post">
        <c:forEach items="${reviewList}" var="review">
            <!-- 리뷰 내용 -->
            <div class="listForm">
                <h4 class="fw-bold fs-4">${review.memberId}</h4>
                <div class="lh-sm">${review.reviewContent}</div>
                <div class="d-flex justify-content-end">
                    <div>
                      <%--   <c:if test="${sessionScope.loginMember.memberId eq dto.memberId}"> --%>
                            <a href="${pageContext.request.contextPath}/reviewUpdate?courseNo=${review.courseNo}" 
                            	class="reviewUpdateBtn btn btn-primary">수정</a>
                            <a href="${pageContext.request.contextPath}/reviewRemove?courseNo=${review.courseNo}" 
                            	class="btn btn-primary" style="float:right; margin-right:10px;">삭제</a>
                        <%-- </c:if> --%>
                    </div>
                </div>
                <div >리뷰작성일 : ${review.createDate}</div>
                <div >리뷰수정일 : ${review.updateDate}</div>
                <hr/>
            </div>
          
            <script>  
	            // 댓글 수정창
					$(document).on('click', '.reviewUpdateBtnForm', function () {
					    $(this).parents('.listForm').css('display', 'none');
					    $(this).parents('.listForm').next().css('display', '');
					})
					$(document).on('click', '.reviewUpdateCancel', function () {
					    $(this).parents('.updateForm').css('display', 'none');
					    $(this).parents('.updateForm').prev().css('display', '');
					})
            </script> 
            
            <!-- 리뷰 수정하기 -->
            <div class="reviewUpdateForm" style="display: none">
                <div class="form-floating flex-grow-1 px-2">
                    <textarea class="reviewUpdateContent form-control" style="height: 100px; resize: none;">${review.reviewContent}</textarea>
                </div>
                
                <br>
                <br>
                
                <div class="d-flex justify-content-end mt-2">
                    <a courseNo="${board.courseNo}"
                       class='reviewUpdateBtn btn btn-primary btn-sm mx-1'>등록</a>
                    <a class='reviewUpdateCancel btn btn-primary btn-sm ms-1'>취소</a>
                </div>
                <hr/>
            </div>
         

            
        </c:forEach>
         </form> 
    </div>
</div>
	<script>
	$('.reviewInsertBtn').click(function() {
		var openedLecNoVal = $(this).val(); 
		$.ajax({
			url : 'commons/lectureOne',
			type : 'post',
			data : {openedLecNo : openedLecNoVal, studentCode : $('#coursNo').val()},
			success : function(json) {
				if(json == 'y') {
					alert('리뷰 등록에 성공하셨습니다.');
				} else {
					alert('리뷰 등록에 실패하셨습니다.');
				}
			}
		});
		location.reload();
		return false;
	});
	</script>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<%-- 리뷰 페이지네이션 --%>
	<div>
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
	
	<script type="text/javascript">
		function btn(){
	        alert('장바구니 추가완료!');
	    }
	</script>

	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/resource/inc/footer.jsp"></c:import>
	</div>
</body>
</html>