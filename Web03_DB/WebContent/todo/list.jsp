<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To do List Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
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
	
	.form-group{
		padding:10px 0;
	}
	
	.form-group>label{
		margin:0 10px;
	}

</style>
</head>
<body>
<% 
	TodoDao dao = TodoDao.getInstance();
	List<TodoDto> list = dao.getList();
%>
	<div class="container-fluid">
		<!-- 강의 -->
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
	
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
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
	
		<div class="header">To do list 입니다.</div>
	
		<form action="insert.jsp" method="post" class="form-inline">
			<div class="form-group">
				<label>할 일 추가하기</label>
				<input type="text" name="content" placeholder="Enter your new Task" class="form-control"/>
				<button type="submit" class="btn btn-outline-success">추가</button>
			</div>
		</form>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>To do list</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(TodoDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getContent() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div><!-- container-fluid -->
</body>
</html>