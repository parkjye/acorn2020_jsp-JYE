<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//servlet단에서 담은 sample data라고 가정한다.
	List<FileDto> list = new ArrayList<>();
	
	FileDto dto1 = new FileDto();
	dto1.setNum(1);
	dto1.setWriter("김구라");
	dto1.setTitle("제목1");
	
	FileDto dto2 = new FileDto();
	dto2.setNum(2);
	dto2.setWriter("해골");
	dto2.setTitle("제목2");
	
	FileDto dto3 = new FileDto();
	dto3.setNum(3);
	dto3.setWriter("원숭이");
	dto3.setTitle("제목3");

	list.add(dto1);
	list.add(dto2);
	list.add(dto3);

	/*
		EL로 추출할 수 있도록 request 영역에 담는다.
		* List를 담을 때 제너릭 타입 주의해야 한다.
	*/
	
	request.setAttribute("list", list);
	
	
	String hobby = "piano/game/reading";
	request.setAttribute("forFun", hobby);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test3.jsp</title>
</head>
<body>
<h1>List에 들어 있는 Dto 활용</h1>
<table>
	<thead>
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="tmp" items="${list }" >
			<td>${tmp.num }</td>
			<td>${tmp.writer }</td>
			<td>${tmp.title }</td>
		</c:forEach>
	</tbody>
</table>

<h1>취미 입니다</h1>
<ul>
	<c:forTokens var="tmp" items="${forFun }" delims="/">
		<li>${tmp }</li>
	</c:forTokens>
</ul>

<a href="jstl_test4.jsp">다음예제</a>
</body>
</html>