<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
<style>
	.header{
		/*position: fixed;
		display: flex;*/
		
		margin-bottom: 10px;
		padding:5px 0;
		
	    width: 100%;
	    height: 5%;
	    
	    border-top: solid 1px grey;
	    border-bottom: solid 3px grey;
	    
	    text-align: center;
	    font-size: 1.5em;
	}
	
	.nav{
		background-color: lightcyan;
	}
	
	/* <a>삭제, 수정</a> */
	.tLink{
		color:#ffcccc;
		/*text-decoration:none;*/
	}
	
	.tLink:hover{
		color:#ffcccc;
		/*text-decoration: underline;*/
	}
	
</style>
</head>
<body>
<% 
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao = MemberDao.getInstance();

	//회원목록 얻어오기
	List<MemberDto> list = dao.getList();
%>
	<div class="container-fluid">
	
		<!-- 강의 -->
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
	
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
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
	
		<div class="header">회원 목록 입니다.</div>
		
		<!--  
		<div class="aLink">
			<a href="insertform.jsp">회원 추가 하러 가기</a> 
		</div>-->
		
		<table class="table table-striped table-dark">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDto tmp:list){%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
					<td><a class="tLink" href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
					<td><a class="tLink" href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		
	</div>
</body>
</html>