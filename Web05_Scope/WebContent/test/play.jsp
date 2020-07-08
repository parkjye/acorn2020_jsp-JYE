<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLAY!</title>
</head>
<body>
<%
	//seetion영역에 "nick"이라는 키 값으로 저장된 String type 읽어오기
	//value가 없으면 null
	String nick = (String)session.getAttribute("nick");
%>

	<p><strong><%=nick %></strong>님 놀러 오셨네요?</p>
	<p>신나게 놀아 보아요</p>
	<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>