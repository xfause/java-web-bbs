<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    addboard.jsp
 * Description:  添加板块
 */
--%>
<%
if(request.getParameter("submit")!=null&&!"".equals(request.getParameter("submit"))){
	
	bbs.Op_board add = new bbs.Op_board();
	if(add.addBoard(request,session)){
		response.sendRedirect("../showboard.jsp");
	}
	else{
		out.print("插入数据失败");
	}
}




%>
<html>
<head>

<title>myBlog</title>

</head>



<body >

<center><img src="../images/logo.jpg"></center>
<center>

	<%if(session.getAttribute("userName")==null){ %>
	<a href="login.jsp">登陆</a>
    <a href="reg.jsp">注册</a>
    <%}
    else{
     %>

	欢迎<% out.print(session.getAttribute("userName")); %>

	<a href="../logout.jsp" onClick="{if(confirm('确定要注销吗')){return ture;}return false;}">注销</a>
	
	<%} %>
	
	<td align="center"><a href="../showboard.jsp">返回</a></tr>
	</center>
	<br/>
	
	<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#0089cf" border="0" align="center">
	<TR>
	<TD>
	<TABLE cellSpacing="1" cellPadding="4" width="100%" border="0">
	<TR bgColor="#ccccff"></tr>
	<TR bgColor=#ffffff>
	<TD align="left" valign="top" width=<%= request.getParameter("width") %>>

<p>&nbsp;</p>

<form name="formBlog" action="addboard.jsp" method="post">

<table width="90%" heigth="" border="1" cellspacing="1" cellpadding="1" align="center" >

<tr><td>新板块名称:<input type="text" name="title" size="50" value="无标题" maxlength="100">

<%
	//java.util.Date date = new java.util.Date();
	out.print(new java.util.Date());
%>
	
</td></tr>
<tr><td align="top">新板块介绍：</td></tr>
<tr><td align="top"><textarea name="content" cols="80" rows="15"></textarea></td></tr>
<tr><td align="center"><input type="submit" name="submit" value="submit"></td>



</table>
<p>&nbsp;</p>
</form>

<jsp:include page="../include/footer.jsp" flush="true" />


</body>
</html>