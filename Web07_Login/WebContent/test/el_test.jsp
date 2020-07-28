<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/el_test.jsp</title>
</head>
<body>
	<h1>Expression Language 테스트</h1>
	<p>jsp 페이지에서 특별하게 해석되는 코드 블럭</p>
	<p>EL영역은 &#36;{ }로 만들 수 있습니다.</p>
	
	<h2>산술연산</h2>
	<p>1+1 = ${1+1 }</p>
	<p>10-1 = ${10-1 }</p>
	<p>10*10 = ${10*10 }</p>
	<p>10/3 = ${10/3 }</p>
	
	<h2>비교연산</h2>
	<!-- EL안에서 유효한 예약어이다. 
		기호 대신 예약어를 사용하는 것이 좋다.
		
		gt(grater)
		ge(grater equal)
		
		lt
		le
	-->
	
	<p>10 &gt; 2 : ${10 > 2 }</p>
	<p>10 &gt; 2 : ${10 gt 2 }</p>
	<p>10 &ge; 2 : ${10 >= 2 }</p>
	<p>10 &ge; 2 : ${10 ge 2 }</p>
	
	<p>10 &lt; 2 : ${10 < 2 }</p>
	<p>10 &lt; 2 : ${10 lt 2 }</p>
	<p>10 &le; 2 : ${10 <= 2 }</p>
	<p>10 &le; 2 : ${10 le 2 }</p>
	
	<p>10 &eq; 2 : ${10 == 2 }</p>
	<!--  <p>10 &eq; 2 : ${10 != eq 2 }</p>-->
	<p>10 &ne; 2 : ${10 != 2 }</p>
	<!--<p>10 &ne; 2 : ${10 ne 2 }</p>-->
	
	<h2>논리연산</h2>
	<p>true || false : ${true || false }</p>
	<p>true or false : ${true or false }</p>
	<p>true && false : ${true && false }</p>
	<p>true and false : ${true and false }</p>
	<p>!true : ${!true }</p>
	<p>not true: ${not true }</p>
	
	<h2>empty 연산자(empty 여부 판단)</h2>
	<p>null 또는 빈문자열("")은 비어(empty)있다고 판정된다.</p>
	<p>empty null : ${empty null }</p>
	<p>empty "" : ${empty "" }</p>
	<p>not empty null : ${not empty null }</p>
	<p>not empty "" : ${not empty "" }</p>
</body>
</html>