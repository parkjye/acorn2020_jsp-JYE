<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<%
	//id라는 키 값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id = (String)session.getAttribute("id");

%>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		
		<%if(id != null) {%>
			<p>
				<a href="users/info.jsp"><%=id %></a> 님 로그인 중 ...
				<a href="users/logout.jsp">로그아웃</a>
			</p>
		<%} %>
		
		<ul>
			<li><a href="users/signup_form.jsp">회원가입</a></li>
			<li><a href="users/loginform.jsp">로그인</a></li>
		</ul>
	</div>
</body>
</html>