<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 삭제는 항상 2단계로 진행 [1.파일 시스템 2.DB]
    	
    			
    	//1. 파라미터로 전달되는 삭제할 파일의 번호를 읽어온다.
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    
    	//2. DB에서 해당 파일의 정보(saveFileName)를 읽어온다.
    	FileDao dao = FileDao.getInstance();
    	FileDto dto = dao.getData(num);
    	
    	
    	//3. 파일 시스템에서 해당 파일을 삭제한다.
    	
    	//3-1. 로그인된 아이디와 글 작성자가 같을 때만 삭제 되도록한다.
    	String id = (String)session.getAttribute("id");

    	if(!dto.getWriter().equals(id)){ //글 작성자와 로그인된 아이디가 다르면
			//.sendError(에러코드, 메시지)
    		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우는거 ㄴㄴ");
    		return; 
    	}
    	
    	//3-2. 파일 시스템에서 해당 파일을 삭제한다.
    	String path=application.getRealPath("/upload")+
    		File.separator+dto.getSaveFileName();
    	
    	//File 객체 내에 있는 delete()를 이용해서 파일을 삭제한다.
    	boolean isSuccessFile = new File(path).delete();
    	
    	
    	//4. DB에서 해당 파일의 정보를 삭제한다.
    	boolean isSuccessDB = dao.deleteFile(num);
    
    	
    	/* 5. 응답 [solution 01]
    	String cPath=request.getContextPath();
    	response.sendRedirect(cPath+"/file/list/jsp"); */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 응답 [solution 02] -->
<%if(isSuccessFile && isSuccessDB){ %>
	<script>
		alert("파일이 삭제되었습니다.");
		location.href="${pageContext.request.contextPath}/file/list.jsp";
	</script>
<%} else {%>
	<script>
		alert("파일 삭제 실패");
		location.href="${pageContext.request.contextPath}/file/list.jsp";
	</script>
<%} %>
</body>
</html>