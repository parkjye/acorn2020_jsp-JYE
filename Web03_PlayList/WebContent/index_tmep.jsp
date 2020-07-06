<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
<link rel="stylesheet" href="/Web03_PlayList/css/indexCss.css" />
<style>
	.navWrapSecond{
		background-color: cyan; /**/
		
		width: 50%;
		height: ;
		
		margin: 0 auto;
		
		vertical-align: middle;
	}
</style>
</head>
<body id="overrides">
	<div class="Wrap">
		<div class="header">
			<a href="${pageContext.request.contextPath }">Hello, Choose Your List!</a>
		</div>
		
		<div class="addListWrap">
			<ul>
				<li><a href="${pageContext.request.contextPath }/playlist/insertform.jsp">Add a new LIST</a></li>
			</ul>
		</div>
		
		<div class="navWrap">
			<ul>
				<li><a href="${pageContext.request.contextPath }">HOME</a></li>
				<li><a href="${pageContext.request.contextPath }/playlist/insertform.jsp">음악 추가</a></li>
				<li><a href="${pageContext.request.contextPath }/playlist/pList.jsp">table: palylist</a></li>
				<li><a href="#">List 2</a></li>
				<li><a href="#">List 3</a></li>
			</ul>
		</div><!-- navWrap -->
	</div><!-- container -->
</body>
</html>