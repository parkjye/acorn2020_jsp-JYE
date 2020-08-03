<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/insert.jsp</title>
<style>
	#content{
		width: 768px;
		border: 1px dotted #cecece;
		box-shadow: 1px 1px 1px 1px #ccc;
	}
	
	.regularWrap{
		background: lightyellow;
	}
</style>
</head>
<body>
<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	System.out.println(content);
	
	String id = request.getParameter("id");
	String phone = request.getParameter("phone");
%>
<p><%=title %></p>
<div id="content"><%=content %></div>

<div class="regularWrap">
	<h3>정규 표현식 연습 예제</h3>
	
	<p>ID: <%=id %></p>
	<p>Phone: <%=phone %></p>
</div>
</body>
</html>