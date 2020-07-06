<%@page import="test.playlist.dto.PlaylistDto"%>
<%@page import="java.util.List"%>
<%@page import="test.playlist.dao.PlaylistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	.header{
		/*position: fixed;
		display: flex;*/
		
		margin-bottom: 10px;
		padding:5px 0;
		
	    width: 100%;
	    height: 5%;
	    
	    border-top: solid 1px grey;
	    border-bottom: solid 3px grey;
	    
	    text-align: center;
	    font-size: 1.5em;
	}
	
	.navWrapSecond{

		width: 100%;
		margin: 10px auto;
		
		border-top: solid 1px #ff99ff;
		border-bottom: solid 3px #b300b3;
	}
	
	/* <a>삭제, 수정</a> */
	.tLink{
		color:#ffcccc;
		/*text-decoration:none;*/
	}
	
	.tLink:hover{
		color:#ffcccc;
		/*text-decoration: underline;*/
	}

</style>
</head>
<body>
<%
	PlaylistDao dao = PlaylistDao.getInstance();
	List<PlaylistDto> list = dao.getList();
%>
	<div class="container">
		<!-- <div class="header"><a href="${pageContext.request.contextPath }">Hello, Choose Your List!</a></div>
		 
		<div class="navWrap">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/addANewList.jsp">Add a new LIST</a></li>
			</ul>
		</div>-->
		
		<div class="navWrapSecond">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/playlist/insertform.jsp">음악 추가</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/playlist/pList.jsp">table: palylist</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List 2</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List 3</a></li>
			</ul>
		</div><!-- navWrap -->
		<div class="contentWrap">
			<!--  <div class="albumArt">albumArt_img</div>-->
			<div class="content">
				<table class="table table-striped table-dark">
					<thead>
						<tr>
							<th>번호</th>
							<th>선택</th>
							<th>제목</th>
							<th>가수</th>
							<th>시간</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(PlaylistDto tmp:list){
						%>
						<tr>
							<td><%=tmp.getNum() %></td>
							<td><%=tmp.getChecked() %></td>
							<td><%=tmp.getTitle() %></td>
							<td><%=tmp.getSinger() %></td>
							<td><%=tmp.getTime() %></td>
							<td><a a class="tLink" href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
							<td><a a class="tLink" href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		
		<!--  <div class="footer">footer_search</div>-->
	</div><!-- container -->
</body>
</html>