<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
<style>
	.nav{
		background-color: lightcyan;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="header"><span></span></div>
	
	<!-- 강의 -->
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
	
	<div class="content"><span></span></div>
	<div class="footer"><span></span></div>
</div><!-- container -->
</body>
</html>