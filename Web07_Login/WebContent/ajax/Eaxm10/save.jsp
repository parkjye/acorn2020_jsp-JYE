<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String getName = request.getParameter("name");
	String getPhone = request.getParameter("phone");
	System.out.println("이름: "+getName+" | 번호: "+getPhone);
	
	boolean isSuccess=true;
%>
{"isSuccess":<%=isSuccess %>}