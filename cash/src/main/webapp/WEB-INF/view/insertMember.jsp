<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertMember</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#id').focus();
		
		$('#id').blur(function(){//마우스가 벗아나면 생기는 이벤트
				$.ajax({
						url:'/admin/idCheck',
						type:'post',
						data:{id:$('#id').val()},
						success:function(data){
							if(data=="yes" && $('#id').val()!=''){
								alert($(id).val()+'사용가능한 ID입니다.');
								$('#pw').focus();
							}else if($('#id').val()==''){
								alert('ID를 입력하세요.');
								$('#id').focus();
							}
							else{
								alert($(id).val()+'사용중인 ID입니다.');
								$('#id').val('');
								$('#id').focus();
							}
						}
					});
				$.ajax({
						
					})
			})
	})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>사용자 추가</h1>
	
	<form method="post" action="/admin/insertMember">
		<div>
			ID:<input type="text" id="id" name="id">
		</div>
		<div>
			PW:<input type="password" id="pw" name="pw">
		</div>
		<div>
			<button type="submit" id="insertMember">addMember</button>
		</div>
	</form>
</body>
</html>