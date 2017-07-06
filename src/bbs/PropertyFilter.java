package bbs;

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

/**
 * Servlet Filter implementation class PropertyFilter
 */
@WebFilter("/PropertyFilter")
public class PropertyFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PropertyFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;

	    HttpSession session = req.getSession();
	    
	    if(session.getAttribute("userName")==null){
	    	res.sendRedirect("../failure.jsp");
	    }
	    else{
		    if (session.getAttribute("property").equals(Integer.parseInt("1"))) {
		        
		    	System.out.println("第一个chain.doFilter");
		    	chain.doFilter(request, response);
		    	return;
		        
		    } else {
		        res.sendRedirect("../failure.jsp");
		    }
		}
		// pass the request along the filter chain
	    System.out.println("第二个chain.doFilter");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
