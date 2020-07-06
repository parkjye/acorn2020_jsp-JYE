<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가 페이지</title>
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
	    font-size: 1em;
	}
	
	.nav{
		background-color: lightcyan;
	}
	
	.contents{
		/*display:inline-block;*/
		margin: 0 auto;
		
		width:60%;
		height:100%;
	}
	
	.btnContainer{
		float: right;
	}
</style>
</head>
<body>
	<div class="container-fluid">
	
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
	
		<div class="header"><h1>회원 정보 추가</h1></div>
		
		<div class="contents">
			<form action="insert.jsp" method="post">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" name="name" id="name"/>
				</div>
				
				<div class="form-group">
					<label for="addr">주소</label>
					<input type="text" class="form-control" name="addr" id="addr"/>
				</div>
				
				<div class="btnContainer">
					<button type="submit" class="btn btn-primary btn-sm">추가</button>
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
				</div>
			</form>
		</div><!-- contents -->
	</div>
</body>
</html>