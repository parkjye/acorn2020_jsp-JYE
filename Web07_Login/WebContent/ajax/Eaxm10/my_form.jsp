<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="save.jsp"  method="post" id="myForm">
		<input type="text" name="name" id="name" placeholder="이름"/>
		<input type="text" name="phone" id="phone" placeholder="전화번호"/>
		<button type="submit">전송</button>
	</form>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	$("#myForm").on("submit", function(){
		var method=$(this).attr(method);
		var action=$(this).attr(action);
		var query=$(this).seliarize();
		
		$.ajax({
			method:method,
			url:action,
			data:query,
			success:function(data){
				console.log(data);
			}
		});
		return false;
	});
</script>
</html>