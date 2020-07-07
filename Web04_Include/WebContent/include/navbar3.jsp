<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include3/navbar.jsp --%>

<%
	String thisPage = request.getParameter("thisPage");
%>
<div class="navbar navbar-expand-sm navbar-dark" style="background-color:#6351ce">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/">ACORN</a>
	<ul class="navbar-nav">
		<li class="nav-item <%if(thisPage.equals("home")){%>active<%}%>">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a>
		</li>
		<li class="nav-item <%if(thisPage.equals("game")){%>active<%}%>">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a>
		</li>
		<li class="nav-item <%if(thisPage.equals("study")){%>active<%}%>">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a>
		</li>
	</ul>
</div>