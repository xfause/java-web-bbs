
<%@page contentType="text/html;charset=UTF-8"%>
<%--
/**
 * Title:    addnew.jsp
 * Description:  添加信息页面
 * Copyright:    Copyright (c) 2005.7.7
 * Company: gutou9
 * @author  gutou9
 * @version 0.1
 */
--%>
<center>
<%
	String msg = request.getParameter("msg");
	out.print(msg);
%>
</center>