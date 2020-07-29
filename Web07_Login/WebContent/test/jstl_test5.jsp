<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%
		//sample data 입니다.
		int num = 123456789;
		request.setAttribute("size", num);
		
		request.setAttribute("price", 250000);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test5.jsp</title>
</head>
<body>
	<h1>숫자 포맷을 도와주는 fmt 사용하기</h1>
	
	<p>파일의 크기는 <fmt:formatNumber value="123456789" pattern="#,###"/> bytes</p>
	<p>파일의 크기는 <fmt:formatNumber value="${size }" pattern="#,###"/> bytes</p>
	
	<p>가격은 <fmt:formatNumber value="250000" type="currency"/>입니다.</p>
	<p>가격은 <fmt:formatNumber value="${price }" type="currency"/>입니다.</p>
	<p>가격은 <fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/>입니다.</p>
	
	<form action="jstl_test6.jsp" method="post">
		<textarea name="content" id="content" cols="30" rows="10"></textarea>
		<button type="submit">전송 후 다음 에제로 이동</button>
	</form>
</body>
</html>