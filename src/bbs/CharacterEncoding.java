package bbs;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.FilterChain;
import java.io.IOException;

public class CharacterEncoding implements Filter ,java.io.Serializable{
	

	public void init(FilterConfig parm1) throws ServletException {

	}


	public void doFilter(ServletRequest req, ServletResponse res, 
				FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding("GBK");
		chain.doFilter(req,res);
		
	}


	public void destroy() {

	}	
}
