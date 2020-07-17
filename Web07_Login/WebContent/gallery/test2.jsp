<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/test.jsp</title>
</head>
<body>
	<h1>이미지 파일 업로드 테스트</h1>
	<form id="myForm" action="test_upload2.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="설명 입력..."/>
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		<button type="submit">업로드</button>
	</form>
	
	<div id="wrapper"></div>

	<!-- jquery로딩 -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
	<!-- jquery 플러그인 로딩 $().ajaxForm() 기능을 사용할 예정 -->
	<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
	<!-- coustom javaScript 코딩 -->
	<script>
		//id가 myForm인 form에 submit 이벤트가 일어나면 페이지 전환없이 제출하기(ajax)
		$("#myForm").ajaxForm(function(data){
			console.log(data);
			
			//if( #wrapper>img 개수를 일정 개수 까지만 받도록 조건) {}
			$("<img/>")
			.attr("src","${pageContext.request.contextPath}"+data.imageSrc)
			.appendTo("#wrapper");
		});
	</script>
</body>
</html>