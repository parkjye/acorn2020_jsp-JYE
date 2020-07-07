<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test6/home.jsp</title>
<%-- include된 페이지에 필요한 css도 여기서 로딩을 해야한다. --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	#coustomDiv > a {margin:0 10px}
</style>
</head>
<body>
	<%-- 
		include될 jsp페이지는 반드시 *상대경로*로 찾아가야한다. 
	
		thisPage라는 파라미터 명으로 home 이라는 문자열 전달하기
			<jsp:include></jsp:include>내에서 주석 금지
	--%>
	<jsp:include page="../include/navbar3.jsp">
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	
	<h1>home페이지 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum obcaecati accusantium fugiat ipsam facilis maiores aut mollitia voluptatem autem totam ab natus voluptatum rerum iste magnam cupiditate esse eaque saepe.</p>

	<!-- include footer -->
	<jsp:include page="../include/footer.jsp">
		<jsp:param value="game" name="thisPageFooter"/>
	</jsp:include>
</body>
</html>