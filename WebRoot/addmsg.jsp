
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>

<%--
/**
 * Title:    addmsg.jsp
 * Description:  发表文章
 */
--%>

<center><img src="./images/logo.jpg"></center>
<center>

	<%if(session.getAttribute("userName")==null){ %>
	<a href="login.jsp">登陆</a>
    <a href="reg.jsp">注册</a>
    <%}
    else{
     %>

	欢迎<% out.print(session.getAttribute("userName")); %>

	<a href="logout.jsp" onClick="{if(confirm('确定要注销吗')){return ture;}return false;}">注销</a>
	
	<%} %>
	
	<a href="showmsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">返回</a>
	</center>
	<br/>
	
	<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#0089cf" border="0" align="center">
	<TR>
	<TD>
	<TABLE cellSpacing="1" cellPadding="4" width="100%" border="0">
	<TR bgColor="#ccccff"></tr>
	<TR bgColor=#ffffff>
	<TD align="left" valign="top" width=<%= request.getParameter("width") %>>

<%	


if(request.getParameter("submit")!=null&&!"".equals(request.getParameter("submit"))){
	
	bbs.Op_msg add = new bbs.Op_msg();
	String msg = add.addmsg(request,session);
	if("ok".equalsIgnoreCase(msg)){
		//response.sendRedirect("showaticle.jsp");
		out.println(request.getParameter("boardID"));
		out.println(request.getParameter("PID"));
		if(request.getParameter("submit").equalsIgnoreCase("reply")){
			response.sendRedirect("showaticle.jsp?boardID="+request.getParameter("boardID")+"&msgID="+
			request.getParameter("PID"));
		}
		else{
			response.sendRedirect("showmsg.jsp?boardID="+request.getParameter("boardID")+"&msgID="+
			request.getParameter("PID"));
		}
	}
	else{
		out.print(msg);
	}
}


%>
<html>
<head>

<title>发表文章</title>

</head>

<body >
<p>&nbsp;</p>

<form name="formBlog" action="addmsg.jsp" method="post">


<input type="hidden" name="boardID" value="<%=request.getParameter("boardID")%>">
<input type="hidden" name="PID" 	value="<%=request.getParameter("msgID")%>">

<table width="90%" heigth="" border="1" cellspacing="1" cellpadding="1" align="center" >

<tr><td>文章主题:<input type="text" name="title" size="50" value="无主题" maxlength="100">

<%
	//java.util.Date date = new java.util.Date();
	out.print(new java.util.Date());
%>
	
</td></tr>
<tr><td align="top">文章内容:</td></tr>
<tr><td align="top"><textarea name="content" cols="80" rows="15"></textarea></td>
</tr>
<tr><td align="center"><input type="submit" name="submit" value="submit"></td></tr>


</table>
<p>&nbsp;</p>
</form>

<jsp:include page="./include/footer.jsp" flush="true" />

</body>
</html>