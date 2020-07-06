<%@page import="test.playlist.dao.PlaylistDao"%>
<%@page import="test.playlist.dto.PlaylistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    
		String title = request.getParameter("title");
		String singer = request.getParameter("singer");
    	
		PlaylistDto dto = new PlaylistDto();
		dto.setTitle(title);
		dto.setSinger(singer);
		
		PlaylistDao dao = PlaylistDao.getInstance();
		dao.insert(dto);
		
		//
		String cPath=request.getContextPath();
		response.sendRedirect(cPath+"/playlist/pList.jsp");
    %>