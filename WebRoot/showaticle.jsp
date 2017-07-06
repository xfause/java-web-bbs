<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    showaticle.jsp
 * Description:  显示帖子信息
 */
--%>



<body>
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
	<TD align="left" valign="top" width="100%" %>
	
	

	<table  border="1" width="100%" align="center" style="word-break:break-all; word-wrap:break-all;">

	<br/>

<%

	bbs.Op_msg show = new bbs.Op_msg();
	java.util.ArrayList al = show.showAticle(request);
	if(al==null){
%>
<jsp:forward page="error.jsp">
	<jsp:param name="msg" value="未知主题" />
</jsp:forward>

<%
	}

	java.util.Iterator it = al.iterator();
	while(it.hasNext()){
		bbs.ForumBean fb = (bbs.ForumBean)it.next();
%>
<tr><td><FONT face=黑体 color=#0089cf size=3><b>主题：</b></FONT></td></tr>
<tr>
	<td><%=fb.gettitle()%></a></td>
</tr>
<tr><td><FONT face=黑体 color=#0089cf size=2>&nbsp&nbsp用户：</FONT></td></tr>
<tr>
	<td>&nbsp&nbsp<%=fb.getauthor()%></td>
</tr>
<tr><td><FONT face=黑体 color=#0089cf size=2>&nbsp&nbsp时间：</FONT></td></tr>
<tr><td>&nbsp&nbsp<%=fb.getfirstTime()%></td></tr>
<tr><td><FONT face=黑体 color=#0089cf size=2>&nbsp&nbsp内容：</FONT></td></tr>
<tr>
	<td style="word-break:break-all"><pre>&nbsp&nbsp<%=bbs.DataFormat.toHtml(fb.getcontent())%></pre></td>
</tr>

<%	
	}
	
%>

</table>

<%
//request.setCharacterEncoding("GBK");
if(request.getParameter("submit")!=null&&!"".equals(request.getParameter("submit"))){
	
	bbs.Op_msg add = new bbs.Op_msg();
	
	String msg = add.addmsg(request,session);
	if("ok".equalsIgnoreCase(msg)){
		response.sendRedirect("showaticle.jsp");
	}
	else{
		out.print(msg);
	}
}


%>


<form name="formBlog" action="addmsg.jsp" method="post">


<input type="hidden" name="boardID" value="<%=request.getParameter("boardID")%>">
<input type="hidden" name="PID" 	value="<%=request.getParameter("msgID")%>">

<table width="90%" heigth="" border="1" cellspacing="1" cellpadding="1" align="center" >

<tr><td>回复主题:<input type="text" name="title" size="50" value="无主题" maxlength="100">

<%
	out.println(new java.util.Date());
	out.println(request.getParameter("submit"));
%>
	
</td></tr>
<tr><td align="top">内容</td></tr>
<tr><td align="top"><textarea name="content" cols="80" rows="15" ></textarea></td></tr>
<tr><td align="center"><input type="submit" name="submit" value="reply"></td></tr>


</table>
<p>&nbsp;</p>
</form>

<jsp:include page="./include/footer.jsp" flush="true" />
</body>
