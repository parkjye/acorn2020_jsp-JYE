<%@page import="test.playlist.dao.PlaylistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	PlaylistDao.getInstance().delete(num);
    	
    	String cPath=request.getContextPath();
    	
    	/*
    		delete, 리스트 별로 if로 가능한지 확인
    		
    		context path는 절대경로로 작성하지 않는다.
    		(context path 수정, 삭제 시 자동으로 읽어올 수 있도록 코딩해야 한다.)
    	*/
    	response.sendRedirect(cPath+"/playlist/pList.jsp");
    %>
<!DOCTYPE html>