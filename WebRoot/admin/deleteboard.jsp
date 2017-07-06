<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>
<%
	if(session.getAttribute("userName")==null){}
	else{
		if(session.getAttribute("property").equals(Integer.parseInt("1"))){
			bbs.Op_board alter = new bbs.Op_board();
			out.println("已创建删除操作的Op_board");
			if(alter.deleteBoard(request)){
				out.println("已执行删除板块的操作");
				response.sendRedirect("../showboard.jsp");
				return;
			}
		}
	}	
%>