<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fortune.jsp</title>
</head>
<body>
<%
	/*
		request 영역에 "dto"라는 키 값으로 담긴 MemberDto 객체의 참조값 얻어내기
		request.getAttribute("fortuneToday"); object type이니까 원래 type으로 casting한다.
	*/
	String fortuneToday = (String)request.getAttribute("fortuneToday");
%>
	<p>오늘의 운세: <strong><%=fortuneToday %></strong></p>
</body>
</html>