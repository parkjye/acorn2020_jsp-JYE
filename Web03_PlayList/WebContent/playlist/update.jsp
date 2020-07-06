<%@page import="test.playlist.dao.PlaylistDao"%>
<%@page import="test.playlist.dto.PlaylistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		request.setCharacterEncoding("utf-8");
    	
    	int num = Integer.parseInt(request.getParameter("num"));
    	String checked = request.getParameter("checked");
    	String title = request.getParameter("title");
    	String singer = request.getParameter("singer");
    	String time = request.getParameter("time");
    	
    	//DB에 수정반영
    	PlaylistDto dto = new PlaylistDto(num, checked, title, singer, time);
    	boolean isSuccess = PlaylistDao.getInstance().update(dto);    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노래 수정</title>
</head>
<body>
<% if(isSuccess) {%>
	<script>
		alert("<%=dto.getNum()%>번 곡 정보를 수정 했습니다.");
		location.href="pList.jsp";
	</script>
<%} else{%>
	<script>
		alert("<%=dto.getNum()%>번 곡 정보 수정을 실패했습니다.");
		location.href="update.jsp?num=<%=dto.getNum()%>";
	</script>
<%} %>
</body>
</html>