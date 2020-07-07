<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include2/navbar.jsp --%>

<%
	String thisPage = request.getParameter("thisPage");
%>

<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/">ACORN</a>

	<ul class="navbar-nav">
		<% if(thisPage.equals("home")){ %>
			<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
		<%} else if(thisPage.equals("game")) {%>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
			<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
		<%} else if(thisPage.equals("study")) {%>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
			<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
		<%} %>
	</ul>
</div>