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
	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">HOME</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member List</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/updateform.jsp">Add a new member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo List</a></li>
		</ul>
	</div>
	
	<div class="container-fluid">
	
	
		<div class="header">회원 목록 입니다.</div>
	
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
					<!-- "javascript: javascript영역" -->
					<td><a class="tLink" href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
	
<script>
	function deleteConfirm(num) {
		var inDelete=confirm(num+"번 회원을 삭제 하시겠습니까?");
		if(inDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
</body>
</html>