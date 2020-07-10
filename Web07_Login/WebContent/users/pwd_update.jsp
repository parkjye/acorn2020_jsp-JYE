<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		/*
			Goal: 비밀번호 수정
			Caution: 기존에 저장된 비밀번호가 동일한지 확인 후 update. 
				
			Caution 처리를 위해 기존의 회원 정보를 가져와야함. getData()
				A. 기존 비밀번호와 form에서 받은 비밀번호가 동일한지 확인.
				B. 동일하면, 새로 입력받은 비밀번호를 updatePwd()에 전달.
					B-1. 전달할 때 dto에 setID, setPwd해야함.
							__id가 PK이기 때문에 식별가능
							__id null아닌가?
		*/	
    
   		//id랑 pwd, newPwd 가져옴 
    	String id = (String)session.getAttribute("id");
    	String pwd = (String)session.getAttribute("pwd");	
    	String newPwd = (String)session.getAttribute("newPwd");
    	
    	UsersDao dao = UsersDao.getInstance();

    	//[Caution] 기존에 저장된 정보
    	UsersDto dto = dao.getData(id);
    	
    	if(pwd==dto.getPwd()){
    		//동일하면 수정
    	
    	}else {
    		//alert("");
    	}
    	
    	UsersDto newDto = new UsersDto();
    	newDto.setId("id");
    	newDto.setPwd(newPwd);
    	    	    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwd_update.jsp</title>
</head>
<body>

</body>
</html>