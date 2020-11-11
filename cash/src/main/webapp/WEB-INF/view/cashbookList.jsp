<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookList</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>cashbookList</h1>
	<a href="/admin/cashbookListExcel">[ 전체 cashbookList 엑셀파일로 다운 ]</a>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>cashbook_id</th>
					<th>cashbook_kind</th>
					<th>category_name</th>
					<th>cashbook_price</th>
					<th>cashbook_content</th>
					<th>cashbook_date</th>
					<th>create_date</th>
					<th>update_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td>${c.cashbookId}</td>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td>${c.cashbookDate}</td>
						<td>${c.createDate}</td>
						<td>${c.updateDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<c:if test="${currentPage == 1}">
			<a href="/admin/cashbookList/${currentPage+1}">다음</a>
		</c:if>
		
		<c:if test="${currentPage > 1}">
			<a href="/admin/cashbookList/${currentPage-1}">이전</a>
		<a href="/admin/cashbookList/${currentPage+1}">다음</a>
		</c:if>
	</div>
</body>
</html>