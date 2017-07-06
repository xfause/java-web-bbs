package bbs;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.FilterChain;
import java.io.IOException;

public class DataFormatFilter implements Filter ,java.io.Serializable{
	

	public void init(FilterConfig parm1) throws ServletException {

	}


	public void doFilter(ServletRequest req, ServletResponse res, 
				FilterChain chain) throws IOException, ServletException {
	
		System.out.println ("in DataFormatFilter------");
		String paramName	= null;
		String val			= null;
		java.util.Enumeration en= req.getParameterNames();
		while(en.hasMoreElements()){
			paramName	= (String)en.nextElement();
			System.out.println ("paramName"+paramName);
			val			= req.getParameter(paramName);
			System.out.println ("val"+val);
			val			= DataFormat.parseAll(val);
			val			= DataFormat.parseAll(val);			
			System.out.println ("val="+val);
		}

		chain.doFilter(req,res);
		
	}


	public void destroy() {
		
	}	
}

