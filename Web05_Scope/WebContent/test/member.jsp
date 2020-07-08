<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member.jsp</title>
<link rel="stylesheet" href="/Web05_Scope/css/bootstrap.css" />
</head>
<body>
	<% 
		MemberDto dto = (MemberDto)request.getAttribute("dto");
	%>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<td>번호</td>
					<td>이름</td>
					<td>주소</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=dto.getNum() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getAddr() %></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>