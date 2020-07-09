<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>
</head>
<body>
	<h1>인덱스 페이지</h1>
	<form action="test/insert.jsp" method="post">
		<input type="text" name="msg" placeholder="서버에 할 말 입력"/>
		<button type="submit">전송</button>
	</form>
	<%
		//로그인된 아이디 읽어오기
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
	%>
		<h3>가상 로그인 폼</h3>
		<form action="test/login.jsp" method="post">
			<input type="text" name="id" placeholder="id 입력"/>
			<input type="password" name="pwd" placeholder="pw 입력"/>
			<button type="submit">로그인</button>
		</form>	
	<%} else {%>
		<p><strong><%=id %></strong>님이 로그인 중입니다.</p>
		<a href="test/logout.jsp">로그아웃</a>
	<%} %>
	
	<h3>회원 전용 공간 입니다.</h3>
	<ul>
		<li><a href="member/play.jsp">회원 전용 play 공간으로 가기</a></li>
		<li><a href="member/study.jsp">회원 전용 study 공간으로 가기</a></li>
		<li><a href="member/buy.jsp?num=1&amount=10">구입하기</a></li>
	</ul>
</body>
</html>