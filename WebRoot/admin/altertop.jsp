<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>


<%
	bbs.Op_msg alter = new bbs.Op_msg();
	if(alter.altertop(request)){
		response.sendRedirect("altermsg.jsp?boardID="+request.getParameter("boardID")+"&PID=0&msgID=0");
		}
%>