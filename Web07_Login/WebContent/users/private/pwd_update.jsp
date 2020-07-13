<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		/*
			Goal: 비밀번호 수정
			Caution: 기존에 저장된 비밀번호가 동일한지 확인해야한다. 
		*/	
    
		//폼 전송되는 비밀번호를 읽어온다.
		String pwd=request.getParameter("pwd");
    	String newPwd = request.getParameter("newPwd");
    	
    	//세션영역에서 ID읽어오기
    	String id = (String)session.getAttribute("id");
    	
    	//UsersDto객체를 생성해서 담는다.
    	UsersDto dto = new UsersDto();
    	dto.setPwd(pwd);
    	dto.setNewPwd(newPwd);
    	dto.setId(id);
    	
    	//UsersDao 객체를 이용해서 수정반영하고 성공 여부를 리턴 받는다.
    	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);  	    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/pwd_update.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
	<p>비밀번호를 수정했습니다. <a href="${pageContext.request.contextPath}/users/private/info.jsp">확인</a></p>
<%} else{%>
	<p>이전 비밀번호가 일치하지 않습니다. <a href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp">다시 시도</a></p>	
<% }%>
</body>
</html>