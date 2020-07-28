<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String myName = "김구라";
    	/*
    		page Scope에 "myName2"이라는 키 값으로 myName담기
    		page Scope에 담은 키값은 해당 페이지(jsp)내에서만 사용할 수 있다.
    	*/
    	pageContext.setAttribute("myName2", myName);
    	
    	
    	String yourName = "해골";
    	/*
    		request scope에 "yourName2"이라는 키 값으로 yourName담기
    		request scope에 담은 값은 응답하기 전까지 사용할 수 있다.
    		
    		(다른 페이지로 forward이동해도 사용할 수 있다.)
    		(다픈 페이지로 redirect 이동하면 사용할 수 없다.)
    	*/
    	request.setAttribute("yourName2", yourName);
    	
    	
    	String ourName="원숭이";
    	/*
    		session scope에 "ourName2" 라는 키 값으로 ourName담기
    		session scope에 담은 세션이 유지 되는 동안 사용할 수 있다.
    		
    		(다른 페이지로 forward, redirect 이동 해도 사용할 수 있다.)
    		(웹 브라우저를 닫거나 세션을 초기화 하기 전까지 사용할 수 있다.)
    	*/
    	session.setAttribute("ourName2", ourName);
    	
    	String companyName = "에이콘";
    	/*
    		application scope에 "companyName2"이라는 키 값으로 companyName
    		application scope에 담은 내용은 서버를 끄기 전까지 사용할 수 있다.
    		웹 브라우저를 닫아도 지워지지 않는다.
    	*/
    	application.setAttribute("companyName2", companyName);
    	
    	CafeDto cafeDto = new CafeDto();
    	cafeDto.setNum(1);
    	cafeDto.setTitle("원숭아!");
    	cafeDto.setContent("놀자~~");
    	/*
    		request영역에 "dto"라는 키 값으로 CafeDto type인 dto 담기
    	*/
    	request.setAttribute("dto", cafeDto);
    	
    	
    	/*
    		EL 구문으로 ${myName2 } 처럼 표현한 경우 
    		getAttribute 메소드가 실행되는 순서는 다음과 같다.

			request -> session -> application
			
			메소드가 실행되는 순서는 request 객체에서 먼저 실행하고 
			만일 request 객체에 "num"가 등록되어 있지 않다면 
			session에서 실행하고 session에도 없다면 application 객체에서 실행한다.

			
			getAttribute 메소드를 실행한 후 추출된 정보가 있으면 
			아래와 같이 추출된 정보를 원래 등록된 객체의 타입으로 캐스팅 한다.
			
			${dto.num } === ((CafeDto)request.getAttribute("num"));
    	*/
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/el_test2.jsp</title>
</head>
<body>
	<h1>page scope에 저장된 값 추출</h1>
	<p>내 이름은 <strong><%=myName %></strong></p>
	<p>내 이름은 <strong>${pageScope.myName2 }</strong></p>
	<p>내 이름은 <strong>${myName2 }</strong></p>
	
	<h1>EL로 request scope에 저장된 값 추출</h1>
	<p>너의 이름은 <strong>${requestScope.yourName2 }</strong></p>
	<p>너의 이름은 <strong>${yourName2 }</strong></p>
	
	<h1>EL로 session scope에 저장된 값 추출</h1>
	<p>우리 이름은 <strong>${sessionScope.ourName2 }</strong></p>
	<p>우리 이름은 <strong>${ourName2 }</strong></p>
	
	<h1>EL로 application scope에 저장된 값 추출</h1>
	<p>우리 이름은 <strong>${applicationScope.companyName2 }</strong></p>
	<p>우리 이름은 <strong>${companyName2 }</strong></p>
	
	<h1>EL로 request scope에 담긴 dto의 값 추출</h1>
	<p>번호: ${requestScope.dto.getNum() }</p>
	<p>번호: ${dto.getNum() }</p>
	<p>번호: ${dto.num }</p>
	
	<p>제목: ${requestScope.dto.getTitle() }</p>
	<p>제목: ${dto.getTitle() }</p>
	<p>제목: ${dto.title }</p>
	
	<p>내용: ${requestScope.dto.getContent() }</p>
	<p>내용: ${dto.getContent() }</p>
	<p>내용: ${dto.content }</p>
	<p>내용: ${dto.content }</p>
	
	<%--만일 EL를 사용하지 않는다면 아래와 같은 작업이 필요하다. --%>
	<%CafeDto dto2 = (CafeDto)request.getAttribute("dto"); %>
	<p>EL를 사용하지 않은 내용: <%=dto2.getContent() %></p>
	
	<a href="el_test3.jsp?num=1&name=gura">다음 예제</a>
</body>
</html>