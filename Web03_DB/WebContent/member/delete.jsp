<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%

    	int num = Integer.parseInt(request.getParameter("num"));
    	MemberDao.getInstance().delete(num);
    	
    	//3. 응답
    	
    	//리다이렉트 이동시키기 위해 context path를 먼저 읽어온다.
		String cPath=request.getContextPath();
    	
		/*
			회원 목록 보기 요청을 하도록 강요하는 *응답*을 한다. (리다이렉트 이동 시키기)
				/todo/delete.jsp와 달리 <script>alert 필요X
				웹브라우저에서는 새로고침한 것과 같은 반응
		*/
    	response.sendRedirect(cPath+"/member/list.jsp");
    %>