<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//요청 인코딩 설정(한글)
    	request.setCharacterEncoding("utf-8");
    	
    	//(insertform.jsp) name속성의 value를 추출
    	String writer = request.getParameter("writer");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	//작성자, 제목, 내용을 BoardDto에 담는다.
    	BoardDto dto = new BoardDto();
    	dto.setWriter(writer);
    	dto.setTitle(title);
    	dto.setContent(content);
    	
    	//BoardDao객체를 이용해서 DB에 저장하고 성공 여부를 리턴받는다.
    	boolean isSuccess = BoardDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
	<h1>알림</h1>
	<%if(isSuccess){ %>
		<p>
			<strong><%=writer %></strong>님이 작성한 글이 저장되었습니다.
			<a href="list.jsp">확인</a>
		</p>	
	<%} else{ %>
		<p>저장 실패했습니다.</p>
		<a href="insertform.jsp">다시 작성하기</a>
	<%} %>
</body>
</html>