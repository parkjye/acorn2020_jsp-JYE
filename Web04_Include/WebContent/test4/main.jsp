<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test4/main.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<%
		/*
			독립적인 Servlet을 사용하기 때문에 동일한 지역변수명을 사용할 수 있다.
			각자 coding내용에 영향을 받지 않는다.
			
			(!비교: test2/main.jsp)
		*/
		
		String name="name=해골";
	%>
	<h1>main.jsp 페이지 입니다. <strong><%=name %></strong></h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum quasi est voluptate nesciunt expedita neque nulla voluptates doloribus nisi mollitia amet culpa asperiores perspiciatis aperiam sed iusto eius beatae exercitationem.</p>
	<a href="other.jsp">다른 페이지</a>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>