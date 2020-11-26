<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ListOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//데이터 5개씩 페이징 작업 할 것
		$("#updateBtn0").click(function(){
			$("#comment0").hide();
			$("#commentUpdate0").show();
		})
		$("#updateBtn1").click(function(){
			$("#comment1").hide();
			$("#commentUpdate1").show();
		})
		$("#updateBtn2").click(function(){
			$("#comment2").hide();
			$("#commentUpdate2").show();
		})
		$("#updateBtn3").click(function(){
			$("#comment3").hide();
			$("#commentUpdate3").show();
		})
		$("#updateBtn4").click(function(){
			$("#comment4").hide();
			$("#commentUpdate4").show();
		})
		
	})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항</h1>
	<a href="${pageContext.request.contextPath}/admin/updateNotice/${noticeOne.noticeId}">수정</a>
	<a href="${pageContext.request.contextPath}/admin/removeNot	ice?noticeId=${noticeOne.noticeId}">삭제</a>
	<div>
		<table border="1">
				<tr>
					<th>notice_id</th>
					<td>${noticeOne.noticeId}</td>
				</tr>
				<tr>
					<th>notice_title</th>
					<td>${noticeOne.noticeTitle}</td>
				</tr>
				<tr>
					<th>notice_content</th>
					<td><textarea cols="60" rows="10" readonly="readonly">${noticeOne.noticeContent}</textarea></td>
				</tr>
				<tr>
					<th>notice_date</th>
					<td>${noticeOne.noticeDate}</td>
				</tr>
		</table>
		<br>
		<!-- 파일 -->
		<table border="1">
			<tr>
				<th>첨부 파일</th>
				<td>
					<c:forEach var="nf" items="${noticeOne.noticefileList }">
						<a href="${pageContext.request.contextPath }/upload/${nf.noticefileName }">${nf.noticefileName }</a>
						<br>
					</c:forEach> 
				</td>
			</tr>
		</table>
		<br>
		<table border="1">
			<tr>
				<th>댓글</th>
			</tr>
			<!-- 댓글에 작성일자 추가하기 -->
			<c:forEach var="c" items="${noticeOne.commentList }" varStatus="status">
				<c:if test="${c.commentContent != null}">
					<tr>
						<td>
							<div id="comment${status.index}">
								<input type="text" value="${c.commentContent }" name="commentContent" readonly>
								<a href="${pageContext.request.contextPath }/admin/removeComment?commentId=${c.commentId }&noticeId=${noticeOne.noticeId}">삭제</a>
								
								<button type="button" id="updateBtn${status.index}">수정</button>
							</div>
							
							<form style="display:none" id ="commentUpdate${status.index}" method="post" action="${pageContext.request.contextPath }/admin/updateComment?currentPage=${currentPage}">
								<div>
									<input type="hidden" name="commentId" value="${c.commentId }">
									<input type="hidden" name="noticeId" value="${noticeOne.noticeId}">
									<textarea  rows="3" cols="50" name="commentContent">${c.commentContent }</textarea>
								</div>
								<button type="submit">수정</button>
							</form>
						</td>
					</tr>
				</c:if>
				
				<c:if test="${c.commentContent == null}">
					<!-- 다 삭제했을 때 빈칸이 남아있는 것을 없애기 위해 -->
				</c:if>
			</c:forEach>
		</table>
		<c:if test="${currentPage==1 && lastPage != 1}">
				<a href="">처음으로</a>
				<a href="">이전</a>
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/${currentPage+1}">다음</a>
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/${lastPage}">마지막으로</a>
			</c:if>
			<c:if test="${currentPage == lastPage && lastPage != 1}">
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/1">처음으로</a>
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/${currentPage-1}">이전</a>
				<a href="">다음</a>
				<a href="">마지막으로</a>
			</c:if>
			<c:if test="${currentPage > 1 && currentPage < lastPage }">
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/1">처음으로</a>
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/${currentPage-1}">이전</a>
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/${currentPage+1}">다음</a>
				<a href="${pageContext.request.contextPath }/admin/noticeOne/${noticeOne.noticeId}/${lastPage}">마지막으로</a>
			</c:if>
			<c:if test="${currentPage == 1 && lastPage == 1 }">
				<a href="">처음으로</a>
				<a href="">이전</a>
				<a href="">다음</a>
				<a href="">마지막으로</a>
			</c:if>
		<br>
		<br>
		<!-- 댓글 쓰기 -->
		<form method="post" action="${pageContext.request.contextPath}/admin/addComment?currentPage=${currentPage}">
			<table border="1">
				<tr>
					<th>댓글쓰기</th>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="noticeId" value="${noticeOne.noticeId}">
						<textarea cols="50" rows="3" name="commentContent"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit">입력</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>