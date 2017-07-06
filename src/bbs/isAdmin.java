package bbs;
import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import bbs.*;

import javax.servlet.FilterChain;
import java.io.IOException;
import java.sql.SQLException;

public class isAdmin implements Filter {
	

	public void init(FilterConfig parm1) throws ServletException {

	}


	public void doFilter(ServletRequest req, ServletResponse res, 
				FilterChain chain) throws IOException, ServletException {
				
		String sqlStr = "select userID from userInfo where property >5";
		DataBase db = new DataBase();
		java.sql.Connection conn = db.getconn();
		try {
			java.sql.PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		chain.doFilter(req,res);
	}


	public void destroy() {

	}	
}
