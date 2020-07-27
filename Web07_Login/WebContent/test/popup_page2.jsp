<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background-color:#f2e6ff;
	}
</style>
</head>
<body>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur perferendis non velit quasi soluta est repudiandae beatae nobis pariatur molestiae. Odio provident nesciunt distinctio fuga sed magnam quam repudiandae maiores?</p>

<form action="popup_save.jsp" method="post">
	<label for="">
		<input type="checkbox" name="canPopup" value="no"/>1분동안 팝업 띄우지 않기	
	</label>
	<button type="submit">닫기</button>
</form>
</body>
</html>