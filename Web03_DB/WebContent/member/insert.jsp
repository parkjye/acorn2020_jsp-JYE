<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//비즈니스 로직
	//1. 폼 전송되는 이름, 주소를 읽어온다.
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	//2. MemberDao 객체를 이용해서 DB에 저장한다.
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	MemberDao dao = MemberDao.getInstance();
	dao.insert(dto);
	
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가 페이지</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
<style>
	.nav{
		background-color: lightcyan;
	}
</style>
</head>
<body>
	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
		</ul>
	</div>
	
	<div class="nav">
		<ul class="nav justify-content-center">
			<li class="nav-item">
			   	<a class="nav-link" href="${pageContext.request.contextPath}/">HOME</a>
			</li>
			<li class="nav-item">
			   	<a class="nav-link active" href="${pageContext.request.contextPath}/member/list.jsp">회원 목록 보기</a>
			</li>
			<li class="nav-item">
			    <a class="nav-link" href="${pageContext.request.contextPath}/member/insertform.jsp">회원 정보 추가</a>
			</li>			
			<li class="nav-item">
			   	<a class="nav-link" href="${pageContext.request.contextPath}/todo/list.jsp">할 일 목록 보기</a>
			</li>
		</ul>
	</div>

	<div class="container-fluid">
		<div class="alert alert-info" role="alert">
			<p><strong><%=dto.getName() %></strong>회원의 정보가 추가 되었습니다. <a class="alert-link" href="list.jsp">확인</a></p>
		</div>
	</div>
</body>
</html>