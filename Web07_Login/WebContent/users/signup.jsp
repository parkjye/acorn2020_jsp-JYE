<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8"); //
    
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String email = request.getParameter("email");
    	
    	UsersDto dto = new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	dto.setEmail(email);
    	
    	boolean isSuccess = UsersDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>
</head>
<body>
<%if(isSuccess) {%>
	<p><strong><%=id %></strong>회원님 가입 되었습니다.</p>
	<a href="loginform.jsp">로그인 하러 가기</a>
<%} else {%>
	<p>가입을 실패했습니다.</p>
<%} %>
</body>
</html>