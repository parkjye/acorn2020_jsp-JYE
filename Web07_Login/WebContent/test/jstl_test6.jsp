<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%
    	//textarea에 입력한 정보를 읽어온다. 개행기호(\n) 포함 되어 있을 수 있다.
    	String content = request.getParameter("content");
    
    	//sample data를(DB에서 불러온 데이터라고 가정) request영역에 담는다.
    	request.setAttribute("content", content);
    	
    	//페이지 영역에 newLine이라는 키 값으로 개행기호 담기
    	pageContext.setAttribute("newLine", "\n");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test6.jsp</title>
</head>
<body>
	<h1>jstl 함수 사용해 보기</h1>
	
	<!-- <c:set var="newLine" value="\n" /> -->
	<p>${fn:replace(content, newLine, '<br/>') }</p>
	
</body>
</html>