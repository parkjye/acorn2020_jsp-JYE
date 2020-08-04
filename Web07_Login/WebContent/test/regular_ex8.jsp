<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/regular_ex8.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>

	//아래의 두 정규 표현식은 같다. \d == 10진수
	var reg1 = /[0-9]/;
	var reg12 = /[\d]/; 
	
	var reg2 = /[^0-9]/;
	var reg22 = /[\D]/; // \d와 반대개념 == 숫자가 아닌 것
	
	var reg3 = /[a-zA-Z0-9]/;
	var reg32 = /[\w]/;
	
	var reg4 = /[^a-xA-Z0-9]/;
	var reg42 = /[\W]/;
	
	//공백(띄어쓰기, tab, 개행기호)을 찾는 정규 표현식
	var reg5 = /[\s]/;
	
	//공백(띄어쓰기, tab, 개행기호)이 아닌 것을 찾는 정규 표현식
	var reg6 = /[\S]/;
	
	//new를 이용한 정규 표현식 객체 생성
	var reg7 = /^[a-z].{4,9}$/;
	var reg72 = new RegExp("^[a-z].{4,9}$");
	
	//abc 문자를 global로 찾는 정규 표현식 객체
	var reg8 = /abc/g;
	var reg82 = new RegExp("abc", "g");
	
	//특수문자가 아닌 것( 문자열 안에서 \를 사용한다면, \\두 개 == \한 개, \\\\개 == \\개)
	var reg9 = /^[\w]+$/;
	var reg92 = new RegExp("^[\\w]+$");
	
</script>
</body>
</html>