<%@page import="test.playlist.dto.PlaylistDto"%>
<%@page import="test.playlist.dao.PlaylistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    
    	int num = Integer.parseInt(request.getParameter("num"));
        PlaylistDao dao = PlaylistDao.getInstance();
        PlaylistDto dto = dao.getSingleList(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노래 수정</title>
<link rel="stylesheet" href="/Web03_PlayList/css/bootstrap.css" />
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
		/*display:inline-block;*/
		margin: 0 auto;
		
		width:50%;
		height:100%;
	}
	
	.nav{
		background-color: lightcyan;
	}
	
	.btnContainer{
		float: right;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header"><h1>노래 수정</h1></div>
		<div class="navWrap">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/playlist/insertform.jsp">음악 추가</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/playlist/pList.jsp">table: palylist</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List 2</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List 3</a></li>
			</ul>
		</div><!-- navWrap -->
		
		<div class="contents">
			<form action="update.jsp" method="post">
				<%--num[PK] disabled로 막고 hidden type 추가 --%>
				<div class="form-group">
					<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
					<label for="num">번호</label>
					<input type="text" id="num" value="<%=dto.getNum()%>" disabled/>
				</div>
			
				<div class="form-group">
					<input type="hidden" name="checked" value="<%=dto.getChecked()%>"/>
					<label for="checked">선택</label>
					<input type="text" id="checked" value="<%=dto.getChecked()%>" disabled/> 
				</div>
			
				<div class="form-group"> 			
					<label for="title">제목</label>
					<input type="text" name="title" id="title" value="<%=dto.getTitle()%>"/>
				</div>
			
				<div class="form-group">
					<label for="singer">가수</label>
					<input type="text" name="singer" id="singer" value="<%=dto.getSinger()%>"/>
				</div>
			
				<div class="form-group">
					<input type="hidden" name="time" value="<%=dto.getTime()%>"/>
					<label for="time">시간</label>
					<input type="text" id="time" value="<%=dto.getTime()%>" disabled/>
				</div>
			
				<div class="btnContainer">
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
				</div>
			</form>
		</div><!-- contents -->
	</div><!-- container -->
</body>
</html>