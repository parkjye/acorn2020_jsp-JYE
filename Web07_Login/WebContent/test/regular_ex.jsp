<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/regular_ex.jsp</title>
</head>
<body>
<p>정규표현식(Regular Expression) 연습</p>

<input type="text" id="id" placeholder="아이디를 입력하세요."/>
<button id="checkBtn">가입</button>

<p>영문자 소문자로 시작하고 5~10글자 이내 특수문자 하나이상 입력하세요.</p>

<a href="regular_ex2.jsp">다음 예제</a>

<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>

	//알파벳 소문자롤 시작하는지 여부를 알아낼 수 있는 정규 표현식 객체
	var reg1 = /^[a-z]/;
	
	/*
		시작-끝을 반드시 명시해야한다.
		명시하지 않으면 조건이 true일 경우 곧바로 종료(return)한다.
		ex. 10글자 이상의 문자열을 입력해도 5~10글자가 이미 true이기때문에
			11글자부터 검증하지 않음(이미 return상태)
		
		시작-끝을 명시하지 않으면 일부만 만족시켜도 true.
	*/
	
	//최소 5글자 최대 10글자인지 검증할 수 있는 정규 표현식 객체
	var reg2 = /^.{5, 10}$/;
	
	//특수문자가 포함 여부를 검증할 수 있는 정규 표현식 객체
	var reg3 = /[^a-zA-Z0-9]/;
	
	//영문자 소문자 시작 + 최소 5글자 최대 10글자인지 검증할 수 있는 정규 표현식 객체
	var reg4 = /^[a-z].{4,9}$/;
	
	//버튼을 클릭했을 때 실행할 함수 등록
	$("#checkBtn").on("click",function(){
		//입력한 문자열을 읽어온다.
		var str=$("#id").val();
		
		//검증한다.
		var result1=reg1.test(str);
		if(result1){
			alert("알파벳 소문자로 시작 합니다.");
		}
		
		var result2 = reg2.test(str);
		if(result2){
			alert("5~10글자를 입력했습니다.");
		}
		
		//특수문자가 포함되어 있는지 검증한다.
		var resutl3 = reg3.test(str);
		if(resutl3){
			alert("특수문자 포함");
		}
		
		if(reg4.test(str)==false){
			alert("영문자 소문자로 시작하는 5~10글자 이내로 작성하세요.");
		}
		
		if(!reg4.test(str)){
			alert("영문자 소문자로 시작하는 5~10글자 이내로 작성하세요.");
		}
	});
</script>
</body>
</html>