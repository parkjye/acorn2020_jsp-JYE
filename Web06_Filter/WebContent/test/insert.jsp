<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //post방식으로 전송했을 경우 한글이 깨지지 않도록 한다.	
    request.setCharacterEncoding("utf-8");
    
		String msg = request.getParameter("msg");
    	//System.out.println("msg: "+msg);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/insert.jsp</title>
</head>
<body>
	<h1>요청을 처리 했습니다.</h1>
	<p>입력한 문자열: <strong><%=msg %></strong></p>
</body>
</html>