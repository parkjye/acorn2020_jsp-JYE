<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = (String)session.getAttribute("id");
    	UsersDto dto = UsersDao.getInstance().getData(id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/info.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	/* 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width:50px;
		height:50px;
		border:1px solid #cecece;
		border-radius:50%;
	}
</style>
</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td><%=dto.getId() %></td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td><%=dto.getProfile() %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="pwd_updateform.jsp">수정하기</a></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
		</table>
		<div class="aWrap">
			<a href="updateform.jsp">개인정보 수정</a>
			<a href="javascript:deleteConfirm()">탈퇴</a>
			<a href="${pageContext.request.contextPath}">index로 이동</a>
		</div>
	</div> <!-- container -->

<script>
	function deleteConfirm() {
		var isDelete = confirm("<%=id%> 회원님 탈퇴 하시겠습니까?");
		if(isDelete) {
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>