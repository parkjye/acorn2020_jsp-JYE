<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<div class="header"><h1>새 글 작성 폼입니다.</h1></div>	
	
	<div class="nav"></div>
	
	<div class="mainContent">
		<form action="insert.jsp" method="post">
			<label for="writer">작성자</label>
			<input type="text" name="writer" id="writer"/>
			
			<label for="title">제목</label>
			<input type="text" name="title" id="writer"/>
			
			<label for="content">내용</label>
			<textarea name="content" id="content" cols="20" rows="5"></textarea>
			
			<div class="btnWrap">
				<input type="submit" value="등록"/>
				<input type="reset" value="취소"/>
			</div>
		</form>
	</div>
</body>
</html>