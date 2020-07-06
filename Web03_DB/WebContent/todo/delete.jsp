<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
		1. 할 일을 삭제
			(GET방식 파라미터로 전달되는) 삭제할 글 번호를 읽어와서 숫자로 바꿔준다.
			delete.jsp?num=x;
	*/
	int num = Integer.parseInt(request.getParameter("num"));
	
	//2. DB에서 실제로 삭제한다.
	TodoDao.getInstance().delete(num);
%>
<!-- 3. 응답한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
	<script>
		alert("Task를 삭제했습니다.");
		//[redirect move] javaScript를 이용해서 클라이언트에게 특정 경로로 재요청 강요하기
		location.href="${pageContext.request.contextPath}/todo/list.jsp";
	</script>
</body>
</html>