<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
		width:768px;
		height: 300px;
		border: 1px dotted red;
		box-shadow: 3px 3px 5px;
	}
</style>
</head>
<body>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println(content);
%>
<p><%=title %></p>
</body>
</html>