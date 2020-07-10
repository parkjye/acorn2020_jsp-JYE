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
<title>users/info.jsp</title>
</head>
<body>
	<div class="container">
		<table>
			<thead>
				<tr>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이메일</td>
					<td>프로필</td>
					<td>가입날짜</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=dto.getId() %></td>
					<td><a href="pwd_updateform.jsp">수정하기</a></td>
					<td><%=dto.getEmail() %></td>
					<td><%=dto.getProfile() %></td>
					<td><%=dto.getRegdate() %></td>
				</tr>
			</tbody>
		</table>
		<div class="aWrap">
			<a href="updateform.jsp">개인정보 수정</a>
			<a href="javascript:deleteConfirm()">탈퇴</a>
			<a href="../index.jsp">index로 이동</a>
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