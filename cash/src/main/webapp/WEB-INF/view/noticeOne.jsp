<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ListOne</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공시사항</h1>
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
		<h3>첨부 파일</h3>
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
		<h3>댓글</h3>
		<table border="1">
			<tr>
				<th>댓글</th>
				<c:forEach var="c" items="${noticeOne.commentList }">
					<td>${c.commentContent }</td>
				</c:forEach> 
			</tr>
		</table>
	</div>
</body>
</html>