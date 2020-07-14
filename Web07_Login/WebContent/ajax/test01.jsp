<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax/test01.jsp</title>
</head>
<body>
	<button id="getBtn">요청하기</button>
	<button id="getBtn2">요청하기2</button>
	<button id="getBtn3">요청하기3</button>
	
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	/* 
		1. 방식
		2. 경로
		3. 요청 파라미터(전달 방법)
		4. 결과를 받을 함수
	*/
	//id가 getBtn인 곳에 "click" 이벤트가 일어났을 때 호출되는 함수 등록 
	$("#getBtn").on("click", function(){
		//jquery의 기능을 이용해서 ajax요청하기
		$.ajax({
			method:"GET", //GET or POST 방식
			url:"${pageContext.request.contextPath}/ajax/getmsg.jsp",
			data:"num=1&name=kimgura", //요청 파라미터
			success:function(responseData){ //(responseData)로 결과가 전달된다.
				console.log(responseData);
			}
		});	
	});
	
	$("#getBtn2").on("click", function(){
		$.ajax({
			method:"GET",
			url:"getmsg.jsp",
			data:{num:2, name:"해골"}, //요청 파라미터를 object로 전달해도 된다.
			success:function(data){ //함수에 전달받는 변수명은 자유롭게 작성가능
				//data는 json형식을 가지고 있는 String type이다.
				console.log(data);
				
				//javascript에서 사용하려면 object로 바꿔서 사용해야한다.
				var obj = JSON.parse(data);
				console.log(obj);
				
				//object로 바꿨기때문에 쉽게 사용할 수 있다.
				alert(obj.msg);
			},
			error:function(){
				console.log("fail");
			}
		});	
	});
	
	$("#getBtn3").on("click", function(){
		$.ajax({
			method:"GET",
			url:"getgreet.jsp", //요청파라미터가 없으면 전달 안해도 된다.
			success:function(data){
				/*
					getgreet.jsp 페이지에서 contentType을 application/json
					이라고 정확히 명시했기 때문에 jquery가 응답된 문자열을
					object로 바꿔서 전달을 해준다.
				*/
				console.log(data);
				alert(data.greet);
			}
		});
	});
</script>
</body>
</html>