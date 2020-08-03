<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="inputMsg" placeholder="하고 싶은 말 입력..." style="width:500px;"/>
<button id="sendBtn">전송</button>

<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//공백이 아닌 한글자가 1번이상 반복되는 문자열(단어)을 모두 추출할 수 있는 정규표현식 객체
	var reg=/[^ ]+/g;
	
	//전송버튼을 눌렀을 때 호출되는 함수 등록
	$("#sendBtn").on("click", function(){
		//입력한 문자열을 읽어온다.
		var msg=$("#inputMsg").val();
		
		//반복문으로 정규 표현식에 부합되는 문자열을 모두 추출한다.
		
		while(true){
			var result = reg.exec(msg);
			if(result==null){
				break;
			}
			alert(result);
			
			//li요소를 만들어서 단어를 출력하고 #wordList에 추가하기
			$("<li/>").text(result).appendTo("#wordList");
		}
	});
</script>
</body>
</html>