<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/loginform.jsp</title>
</head>
<body>
	<h1>로그인 폼 입니다.</h1>
	<form action="login.jsp" method="post">
		<input type="text" name="id" placeholder="id 입력"/>
		<input type="password" name="pwd" placeholder="pw 입력"/>
		<button type="submit">로그인</button>
	</form>
</body>
</html>