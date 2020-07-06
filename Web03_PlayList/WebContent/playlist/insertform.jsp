<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악 추가</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />-->
<style>
	.container {
		
		/*color:#47476b;*/
	}
	.navWrapSecond{

		width: 100%;
		margin: 10px auto;
		
		border-top: solid 1px #ff99ff;
		border-bottom: solid 3px #b300b3;
	}
	
	.contents{
		width:50%;
		margin:0 auto;
	}
	
	.btnContainer{
		float: right;
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
		<div class="contents">
			<form action="insert.jsp" method="post">
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title"/>
				</div>
				
				<div class="form-group">
					<label for="addr">가수</label>
					<input type="text" class="form-control" name="singer" id="singer"/>
				</div>
				
				<div class="btnContainer">
					<button type="submit" class="btn btn-primary btn-sm">추가</button>
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>