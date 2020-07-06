<%@page import="test.playlist.dao.PlaylistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	PlaylistDao.getInstance().delete(num);
    	
    	String cPath=request.getContextPath();
    	
    	//delte, 리스트 별로 if로 가능한지 확인
    	response.sendRedirect(cPath+"/playlist/pList.jsp");
    %>
<!DOCTYPE html>