<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//세션에 저장된 아이디
    	String id = (String)session.getAttribute("id");
    	
    	//수정할 회원의 정보를 읽어온다.
    	UsersDto dto = UsersDao.getInstance().getData(id);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>회원정보 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<div class="form-grop">
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=dto.getId() %>" disabled/>
		</div>
		<div class="form-grop">
			<label for="email">e-mail</label>
			<input type="text" id="email" value="<%=dto.getEmail() %>" />
		</div>
		<div class="btnWrap">
			<button type="submit">수정</button>
			<button type="reset">취소</button> <!-- 최초 출력 형태로 되돌리는 역할 -->
		</div>
	</form>
</div>
</body>
</html>