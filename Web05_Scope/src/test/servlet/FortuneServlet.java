package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 요청(로직): Servlet Page
		 * 				(비즈니스 로직의 수행 결과 + 응답)을 jsp page로 위임(전달)한다.
		 * 응답: jsp Page
		 * 		전달 받은 value를 읽어낸다.
		 * */
		
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행한다.
		String fortuneToday="동쪽으로 가면 귀인을 만나요";
		
		/*
		 * 비즈니스 로직의 수행결과 data를 HttpServletRequest객체에 담는다. 
		 * 	("request" Scope(영역)에 담는다" 라고 표현하기도 한다.)
		 * */
		
		//"fortuneToday"라는 키 값으로 String type의 참조값 받기
		req.setAttribute("fortuneToday", fortuneToday);
		
		/*
		 * getRequestDispatcher() 메소드를 통해서 응답을 위임할 경로(/test/fortune.jsp) 밝혀준다. 
		 * jsp페이지로 응답을 위임한다. (forward 이동)
		 * */
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		
		/* req, resp의 객체가 "/test/fortune.jsp"로 이동된다.
			이때 request영역(객체)에 담아서 전달한다. */
		rd.forward(req, resp);
	
	}
}
