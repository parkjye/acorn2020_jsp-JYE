<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
<link rel="stylesheet" href="/Web03_PlayList/css/bootstrap.css" />
<style>
	.container {
		text-align:center;
		/*color:#47476b;*/
	}
	.navWrapSecond{

		width: 100%;
		margin: 10px auto;
		
		border-top: solid 1px #ff99ff;
		border-bottom: solid 3px #b300b3;
	}
</style>
</head>
<body id="overrides">
	<div class="container">
		<!-- <div class="header"><a href="${pageContext.request.contextPath }">Hello, Choose Your List!</a></div>
		 
		<div class="navWrap">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/addANewList.jsp">Add a new LIST</a></li>
			</ul>
		</div>-->
		
		<div class="navWrapSecond">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/playlist/insertform.jsp">음악 추가</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/playlist/pList.jsp">table: palylist</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List 2</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List 3</a></li>
			</ul>
		</div><!-- navWrap -->
	</div><!-- container -->
</body>
</html>