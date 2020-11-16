<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ListOne</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>noticeList</h1>
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
		<a href="${pageContext.request.contextPath}/admin/noticeList">뒤로</a>
	</div>
</body>
</html>