<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<GalleryDto> list = GalleryDao.getInstance().getList();
%>
<div class="container">
	<a href="private/upload_form.jsp">업로드 하러 가기</a>
	<h1>갤러리 목록입니다.</h1>
	<%for(GalleryDto tmp:list){ %>
	<div class="wrapper">
		<img src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>" alt="GallryImgs" />
		<p><%=tmp.getCaption() %></p>
		<p>
			<strong><%=tmp.getWriter() %></strong>
			<i><%=tmp.getRegdate() %></i>
		</p>
	</div>
	<%} %>
</div>
</body>
</html>