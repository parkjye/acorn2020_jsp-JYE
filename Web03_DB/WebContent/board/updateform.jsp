<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	
	    int num = Integer.parseInt(request.getParameter("num"));
	    BoardDao dao = BoardDao.getInstance();
	    BoardDto dto = dao.getDate(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	.header{
		margin-bottom: 10px;
		padding:5px 0;
		
	    width: 100%;
	    height: 5%;
	    
	    border-top: solid 1px grey;
	    border-bottom: solid 3px grey;
	    
	    text-align: center;
	    font-size: 1em;
	}
	
	.contents{
		width:50%;
		margin:0 auto;
	}
	
	.btnContainer{
		float: right;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header"><h1>게시글 수정 페이지</h1></div>
		
		<div class="contents">
			<form action="update.jsp" method="post">
				<div class="form-group">
					<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
					<label for="num">번호</label>
					<input type="text" id="num" value="<%=dto.getNum()%>" disabled/>
				</div>
				
				<div class="form-group">
					<input type="hidden" name="writer" value="<%=dto.getWriter()%>"/>
					<label for="writer">작성자</label>
					<input type="text" id="writer" value="<%=dto.getWriter()%>" disabled/>
				</div>
				
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" id="title" value="<%=dto.getTitle()%>"/>
				</div>
				
				<div class="form-group">
					<label for="content">내용</label>
					<%-- <textarea> 요소는 value=""가 아닌 내용 사이에 값을 넣는다. --%>
					<textarea name="content" id="content" cols="20" rows="5" ><%=dto.getContent()%></textarea>
				</div>
				
				<div class="btnWrap">
					<button type="submit" class="btn btn-primary btn-sm">확인</button>
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
				</div>
			</form>
		</div><!-- contents -->
		
	</div>
</body>
</html>