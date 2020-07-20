<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//세션에 저장된 아이디
    	String id = (String)session.getAttribute("id");
    	
    	//수정할 회원의 정보를 읽어온다.
    	UsersDto dto = UsersDao.getInstance().getData(id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/updateform.jsp</title>
<style>
	/* 프로필 업로드 폼을 화면에서 숨긴다. */
	#profileForm {
		display:none;
	}
	
	/* 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width:50px;
		height:50px;
		border:1px solid #cecece;
		border-radius:50%;
		curser: pointer;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>회원정보 수정 폼 입니다.</h1>
	<%if(dto.getProfile()==null){ %>
		<a id="profileLink" href="javascrirpt:">
			<img id="profileImage" src="${pageContext.request.contextPath}/images/yellowbird.png" alt="기본 이미지" />
		</a>
	<%} else {%>
		<a id="profileLink" href="javascrirpt:">
			<img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile() %>" alt="" />
		</a>
	<%} %>
	<form action="update.jsp" method="post">
		<input type="hidden" name="profile" id="profile" value="<%=dto.getProfile() %>"/>
		<div class="form-grop">
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=dto.getId() %>" disabled/>
		</div>
		<div class="form-grop">
			<label for="email">e-mail</label>
			<input type="text" id="email" value="<%=dto.getEmail() %>" />
		</div>
		<div class="btnWrap">
			<button type="submit">수정</button>
			<button type="reset">취소</button> <!-- 최초 출력 형태로 되돌리는 역할 -->
		</div><!-- btnWrap -->
	</form>
	
	<form action="profile_upload.jsp" method="post" enctype="mulipart/form-data" id="profileForm">
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG" id="image"/>
	</form>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script>
	//프로필 링크를 클릭했을 때 실행할 함수 등록
	$("#profileLink").on("click", function(){
		//input type="file"을 강제 클릭한다.
		$("#image").click();
	});
	
	//이미지를 클릭했을 때 실행할 함수 등록
	$("#image").on("change", function(){
		//폼을 강제로 제출한다.
		$("#profileForm").submit();
	});
	
	//폼이 ajax로 제출될 수 있도록 플러그인을 동작 시킨다.
	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다. data => {imageSrc:"/upload/xxx.jgp"}
		$("#profileImage")
		.attr("src", "${pageContext.request.contextPath}"+data.imageSrc);
		
		//회원정보 수정 폼 전송될 때 같이 전송 되도록 한다.
		$("#profile").val(data.imageSrc); //input type="hidden"의 value값
	});
</script>

</body>
</html>