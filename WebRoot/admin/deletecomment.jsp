<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>


<%
	bbs.Op_comment alter = new bbs.Op_comment();
	if(alter.deletecomment(request)){	
		response.sendRedirect("showcomment.jsp");
		}
%>