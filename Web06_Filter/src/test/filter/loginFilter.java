package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/*
 * [ solution 02. ] 
 * 	초기화할 파라미터가 없을 경우 *필터 맵핑*	
 * 	web.xml에 필터 정의와 필터 맵핑 어노테이션을 이용해서 할 수 있다.
 * */
@WebFilter("/member/*")
public class loginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		/*
		 * 1. 클라이언트의 로그인 여부를 확인한다.
		 * 		로그인 여부를 확인하려면 getSession()을 사용해야한다.
		 * 		부모type인 ServletRequest request만 인자로 있으니까 
		 * 		자식type(HttpServletRequest)으로 캐스팅한다.
		 * */
		HttpServletRequest req = (HttpServletRequest)request;
		
		//2. HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session = req.getSession();
		
		//3. 로그인된 아이디가 있는지 얻어와본다.
		String id = (String)session.getAttribute("id");
		
		if(id != null) { //로그인 된 상태
			//요청의 흐름을 이어간다.
			chain.doFilter(request, response);
		}else {
			//로그인 폼으로 강제 redirect 응답을 준다.
			
			//자식타입으로 캐스팅 > 객체의 참조값 얻기 > 로그인폼으로 이동
			HttpServletResponse res = (HttpServletResponse)response;
			String cPath = req.getContextPath();
			res.sendRedirect(cPath+"/test/loginform.jsp");
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
