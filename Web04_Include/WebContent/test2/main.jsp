<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    	include 디렉티브를 이용해서 jsp페이지를 include하면
    	해당 페이지에 include된 jsp페이지가 통합되어서 jsp페이지가 만들어진다.
    	결국 실행시점에 사용되는 jsp 페이지는 1개만 사용된다.(=Servlet 1개만 만들어진다.)
    	
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test2/main.jsp<</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<% 
		/*
			header에 동일한 지역 변수가 선언되어 있어서 오류 발생
			String name="원숭이"; 
			작업에 혼돈이 커서 @include는 잘 사용하지 않는다.
		*/
	%>
	
	<h1>main.jsp 페이지 입니다. <strong><%=name %></strong></h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum quasi est voluptate nesciunt expedita neque nulla voluptates doloribus nisi mollitia amet culpa asperiores perspiciatis aperiam sed iusto eius beatae exercitationem.</p>
	<a href="other.jsp">다른 페이지</a>
	
	<%@include file="footer.jsp" %>
</body>
</html>