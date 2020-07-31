<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/jstl_test.jsp</title>
</head>
<body>
<h1>JSTL (Jsp Standard Tag Library)</h1>
<!--  
	0. jstl-1.2.jar 라이브러리를 추가한다.
	1. page 상단에 선언부
	2. (ctrl + space bar) taglib
	3. (ctrl + space bar) uri="http://java.sun.com/jsp/jstl/core"
		core uri는 라이브러리를 추가해야 나온다.
	4. (ctrl + space bar) prefix="c"
		core lib이기 때문에 "c"로 작성하는 것이 일반적이나, 자유롭게 변경 가능하다.
		prefix="c"과 <c:forEach></c:forEach> 를 동일하게 작성해야 한다. 
-->
<c:forEach var="i" begin="1" end="5">
	<p>안녕 ${i }</p>
</c:forEach>

<hr/>

<%for(int i=1; i<=5; i++){ %>
	<p>안녕 <%=i %></p>
<%} %>

<a href="jstl_test2.jsp">다음예제</a>
</body>
</html>
