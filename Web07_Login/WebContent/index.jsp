<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>
<style>
	.loginWrap{
		margin: 20px;
		background: lightyellow;
	}
	
	.login-text{
		text-align:center;
		font-size: 1.2em;
	}
	
	.ulWrap {
		margin: 30px;
	}
	
	#nav-li {
		padding: 5px 20px;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<%
	//id라는 키 값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id = (String)session.getAttribute("id");
%>
	<div class="container">	
		<h1 style="text-align:center; margin: 20px;">인덱스 페이지 입니다.</h1>
		
		<div class="loginWrap">
			<c:if test="${not empty id }">
				<p class="login-text">
					<a href="users/private/info.jsp">${id }</a>님 로그인 중
					<a href="users/logout.jsp">로그아웃</a>
				</p>
			</c:if>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="users/signup_form.jsp">회원가입</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="users/loginform.jsp">로그인</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<!-- 로그인 상태에서만 상품구매 가능 -->
					<a href="test/buy.jsp?code=111">111번 상품 구입 테스트</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="ajax/test01.jsp">Ajax 테스트 1</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="ajax/test02.jsp">Ajax 테스트 2</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="ajax/test03.jsp">Ajax 테스트 3</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="file/list.jsp">자료실 목록 보기</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="gallery/test.jsp">이미지 업로드 TEST</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="gallery/test2.jsp">ajax 이미지 업로드</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="gallery/list.jsp">이미지 갤러리</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="test/editor.jsp">SmartEditor 테스트</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="cafe/list.jsp">카페 글 목록 보기</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="test/scroll.jsp">scroll test</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="test/cookie_form.jsp">쿠키test 1</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="test/cookie_form2.jsp">쿠키test 2</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="test/cookie_form3.jsp">쿠키test 3</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="test/popup.jsp">팝업 test1</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="test/popup2.jsp">팝업 test2</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="test/el_test.jsp">EL test1</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="test/el_test.jsp">EL test2</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="test/jstl_test.jsp">jstl</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="test/jstl_test.jsp">정규표현식 테스트 1</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="fortune">오늘의 운세 [MVC 테스트]</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="todo">할일 목록보기 [MVC 테스트]</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="file">파일 정보 보기 [MVC 테스트]</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="file_list">파일 목록 보기 [MVC 테스트]</a>
				</li>
			</ul>
		</div>
		
		<div class="ulWrap">
			<ul class="nav">
				<li class="nav-item" id="nav-li">
					<a href="#">Disabled</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="#">Disabled</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="#">Disabled</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="#">Disabled</a>
				</li>
				
				<li class="nav-item" id="nav-li">
					<a href="#">Disabled</a>
				</li>
			</ul>
		</div>
	</div><!-- container -->
</body>
</html>