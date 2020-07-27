<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.loader {
		position: fixed; /* 좌하단 고정된 위치에 배치하기 위해 */
		width: 100%;
		
		left:0;
		bottom: 0;
		
		text-align: cneter;

		z-index: 1000; /* position 속성이 설정된 엘리먼트에 대해서만 의미를 갖는다. */
		display: none;
	}
</style>
</head>
<body>
<%
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	
	//보여줄 페이지의 번호(+항상 1페이지를 보여줄 것이기 때문에)
	int pageNum=1;
	
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=GalleryDao.getInstance().getCount();
	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	//객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB 에서 글 목록을 얻어온다.
	List<GalleryDto> list=GalleryDao.getInstance().getList(dto);
	
	//2. 글 목록을 응답한다.
%>
<div class="container">
	<a href="private/upload_form.jsp">업로드 하러 가기</a>
	<h1>갤러리 목록입니다.</h1>
	<%for(GalleryDto tmp:list){ %>
	<div class="wrapper">
		<img src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>" alt="GallryImgs" />
		<p><%=tmp.getCaption() %></p>
		<p>
			<strong><%=tmp.getWriter() %></strong>
			<i><%=tmp.getRegdate() %></i>
		</p>
	</div>
	<%} %>
</div><!-- container -->
<div class="loader">
		<img src="${pageContext.request.contextPath}/images/ajax-loader.gif" alt="ajax-loader" />
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	//페이지가 처음 로딩될때 1page를 보여준다고 가정
	var currentPage=1;
	
	//전체 페이지의 수를 javascript 변수에 담는다.
	var totalPageCount = <%=totalPageCount %>;
	
	//ajax요청이 응답되었는지 여부
	var isSuccess = false;
	
	//웹 브라우저에 scroll이벤트가 일어났을 때 실행할 함수 등록
	$(window).on("scroll", function(){
		console.log("scroll!");
		
		//마지막 페이지일 경우 함수 종료
		if(currentPage == totalPageCount) { 
			return;
		}
		
		//위쪽으로 스크롤된 길이 구하기
		var scrollTop = $(window).scrollTop();
		
		//window의 높이
		var windowHeight = $(window).height();
		
		//document의 높이
		var documentHeight=$(document).height();
		
		//바닥까지 스크롤 되었는지 여부(+10px 여유 추가)
		var isBottom = scrollTop + windowHeight + 10 >= documentHeight;
		
		if(isBottom){//만일 바닥까지 스크롤 했다면
			//로딩 이미지 띄우기
			$(".loader").show();
		
			////페이지를 1증가
			currentPage++; 
			
			//해당 페이지의 내용을 ajax 요청을 해서 받아온다.
			$.ajax({
				url:"ajax_list.jsp",
				method:"get",
				data: {pageNum:currentPage},
				success: function(data){
					//data가 html 마크업 형태의 문자열
					$(".container").append(data);
					//로딩 이미지를 숨긴다
					$(".loader").hide();
				}
			});
		}
	});
</script>
</body>
</html>