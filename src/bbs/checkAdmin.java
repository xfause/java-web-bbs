package bbs;
import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import bbs.*;

import javax.servlet.FilterChain;
import java.io.IOException;
import java.lang.Exception;


public class checkAdmin implements Filter {
	

	public void init(FilterConfig parm1) throws ServletException {

	}


	public void doFilter(ServletRequest request, ServletResponse response, 
				FilterChain chain) throws IOException, ServletException {
				
		javax.servlet.http.HttpServletRequest req = (javax.servlet.http.HttpServletRequest)request;
		javax.servlet.http.HttpServletResponse res = (javax.servlet.http.HttpServletResponse)response;
		javax.servlet.http.HttpSession  sesn = req.getSession(true);
		Op_user check = new Op_user();
		try {
			if(!check.checkAdmin(req,sesn)){
				String msg = "no enough property";
				res.sendRedirect("http://localhost:8080/test/error.jsp?msg="+msg);
				return;
			}
			else{
				chain.doFilter(req,res);
				
			}			
	    }
	    catch (Exception ex) {
	    	ex.printStackTrace();// 这个异常不知道怎么抛出
	    }
			
	

		
	}


	public void destroy() {

	}	
}
