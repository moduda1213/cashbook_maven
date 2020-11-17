<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매년 카테고리별 지출</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(document).ready(function(){
			$.ajax({
					url:'/admin/chart3',
					type:'get',
					success:function(data){
							let html=`
								<tr>//9월
									<td>\${data.beforeLastMonth}월</td>
									<td>\${data.beforeLastTrip}</td>
									<td>\${data.beforeLastLife}</td>
									<td>\${data.beforeLastFood}</td>
									<td>\${data.beforeLastMedical}</td>
									<td>\${data.beforeLastCommu}</td>
								</tr>
								<tr>//10월
									<td>\${data.lastMonth}월</td>
									<td>\${data.lastTrip}</td>
									<td>\${data.lastLife}</td>
									<td>\${data.lastFood}</td>
									<td>\${data.lastMedical}</td>
									<td>\${data.lastCommu}</td>
								</tr>
								<tr>//11월
									<td>\${data.currentMonth}월</td>
									<td>\${data.currentTrip}</td>
									<td>\${data.currentLife}</td>
									<td>\${data.currentFood}</td>
									<td>\${data.currentMedical}</td>
									<td>\${data.currentCommu}</td>
								</tr>
							`;
							$("#tableBody").html(html);
							var ctx = document.getElementById('radarChart');
							var chart = new Chart(ctx,{
									type:'radar',
									data:{
										labels:['관광','생활','식비','의료','통신'],
										datasets:[{
											label:data.beforeLastMonth+'월',
											backgroundColor:'rgba(255,180,180,0.2)',
											borderColor:'#FF6C6C',
											pointHoverBorderWidth: 30,
											pointRadius: 5,
											data:[
												data.beforeLastTrip,
												data.beforeLastLife,
												data.beforeLastFood,
												data.beforeLastMedical,
												data.beforeLastCommu
												]
											},{
											label:data.lastMonth+'월',
											backgroundColor:'rgba(180,255,255,0.2)',
											borderColor:'#368AFF',
											pointHoverBorderWidth: 30,
											pointRadius: 5,
											data:[
												data.lastTrip,
												data.lastLife,
												data.lastFood,
												data.lastMedical,
												data.lastCommu
												]
											},{
											label:data.currentMonth+'월',
											backgroundColor:'rgba(191,255,184,0.2)',
											borderColor:'#1DDB16',
											pointHoverBorderWidth: 30,
											pointRadius: 5,
											data:[
												data.currentTrip,
												data.currentLife,
												data.currentFood,
												data.currentMedical,
												data.currentCommu
												]
											}]
										}
								})
						}
				})
		})
</script>
</head>
<body>
	<jsp:include page ="${pageContext.request.contextPath}/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page ="${pageContext.request.contextPath}/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>매년 카테고리별 지출</h1>
	<div>
		<canvas id="radarChart" width="5"></canvas>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>관광</th>
					<th>생활</th>
					<th>식비</th>
					<th>의료</th>
					<th>통신</th>
				</tr>
			</thead>
			<tbody id="tableBody">
				
			</tbody>
		</table>
	</div>
</body>
</html>