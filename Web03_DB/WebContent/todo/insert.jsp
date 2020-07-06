<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 폼 전송되는 할 일을 읽어온다.
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	
	//2. DB에 저장한다.
	TodoDao dao = TodoDao.getInstance();
	dao.insert(content);	
%>
<!-- 3. 클라이언트 웹 브라우저에 응답한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a list Page</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
<style>
	p{
	    margin-block-start: 0px;
	    margin-block-end: 0px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="alert alert-info" role="alert">
		<p>할 일을 추가했습니다.<a class="alert-link" href="${pageContext.request.contextPath}/todo/list.jsp"> List 확인</a></p>
	</div>
</div>
</body>
</html>