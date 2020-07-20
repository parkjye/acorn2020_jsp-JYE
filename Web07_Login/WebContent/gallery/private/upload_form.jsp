<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>이미지 업로드 폼</h1>
	<form action="upload.jsp" method="post" enctype="mulipart/form-data">
		<label for="caption">설명</label>
		<input type="text" name="caption" id="caption"/>
		
		<label for="caption">이미지</label>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		
		<button type="submit">업로드</button>
	</form>
</div>
</body>
</html>