<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
<style>
	.nav{
		background-color: lightcyan;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="header"></div>

	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">HOME</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member List</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Add a new member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">To do List</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board List</a></li>
		</ul>
	</div>
	
	<div class="content"><span></span></div>
	<div class="footer"><span></span></div>
</div><!-- container -->
</body>
</html>