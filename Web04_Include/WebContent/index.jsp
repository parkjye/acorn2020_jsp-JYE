<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	.container{
		background-color:#f8f9fa;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar3.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>

	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		
		<div class="content">
			<ul>		
				<li><a href="test1/main.jsp">include 디렉티브</a></li> <%-- (response)main.jsp가 응답한다. --%>
				<li><a href="test2/main.jsp">include 디렉티브2</a></li>
				<li><a href=""></a></li>
				<%-- 클라이언트에게 header.jsp / main.jsp / footer.jsp가 공동으로 응답(response)한다. 
					== 3개의 Servlet이 합동으로 응답한다. (jsp도 Servlet이기 때문에)
				--%>
				<li><a href="test3/main.jsp">jsp include</a></li>
				<li><a href="test4/main.jsp">jsp include2</a></li>
				<li><a href=""></a></li>
				<li><a href="test5/home.jsp">home</a></li>
				<li><a href="test5/game.jsp">game</a></li>
				<li><a href="test5/study.jsp">study</a></li>
				<li><a href=""></a></li>
				<li><a href="test6/home.jsp">navbar include example</a></li>
			</ul>
		</div><!-- content -->
	</div><!-- container -->
	
	<jsp:include page="/include/footer.jsp">
		<jsp:param value="index2" name="thisPageFooter"/>
	</jsp:include>
</body>
</html>