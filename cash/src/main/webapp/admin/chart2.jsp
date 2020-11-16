<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2018-2020 월별 지출 차트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
</script>
</head>
<body>
	<jsp:include page ="${pageContext.request.contextPath}/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page ="${pageContext.request.contextPath}/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>2018-2020 월별 지출 차트</h1>
	<div>
		<canvas id="mychart"></canvas>
	</div>
	<div> 
			<table>
				<thead>
					<tr>
						<th>january</th>
						<th>february</th>
						<th>march</th>
						<th>april</th>
						<th>may</th>
						<th>june</th>
						<th>july</th>
						<th>august</th>
						<th>september</th>
						<th>october</th>
						<th>november</th>
						<th>december</th>
					</tr>
				</thead>
				<tbody>
					<tr id="currentYear"></tr>
					<tr id="lastYear"></tr>
					<tr id="beforeLastYear"></tr>
				</tbody>
			</table>
		</div>
</body>
</html>