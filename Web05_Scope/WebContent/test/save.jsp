<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//클라이언트가 폼 전송한 내용을 읽어온다.
    	request.setCharacterEncoding("utf-8");
    	String nick=request.getParameter("nick");
    	
    	//HttpSession 객체에 담는다. (=session 영역에 담는다)
    	session.setAttribute("nick", nick);
    	
    	//60초 동안 새로운 요청을 하지 않을 때 삭제 되도록 설정한다. (초단위로 설정)
    	//session.setMaxInactiveInterval(60*60*24*7); (=일주일)
    	session.setMaxInactiveInterval(60);
    	
    	/*
			[ session 영역에 담은 데이터가 삭제되는 경우 ]
			
			- 새로운 요청을 하지않고 30분이 경과 했을 때(default)
			- 웹 브라우저를 닫았을 때
			- HttpSession 객체의 메소드를 이용해서 제거했을 때(ex.로그아웃)
    	*/
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save.jsp</title>
</head>
<body>
	<p><strong><%=nick %>(이)라는 닉네임을 기억하겠습니다.</strong></p>
	<p>60초 동안 요청을 하지 않으면 삭제됩니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>