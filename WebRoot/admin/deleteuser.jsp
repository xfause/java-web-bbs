<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>


<%
	bbs.Op_user alter = new bbs.Op_user();
	if(alter.deleteuser(request)){	
		response.sendRedirect("manageuser.jsp");
		}
%>


