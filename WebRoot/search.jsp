<%@page contentType="text/html;charset=UTF-8"
pageEncoding="utf-8" %>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    search.jsp
 * Description:  显示搜索的文章

 */
--%>

<center>

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
	
	<a href="showboard.jsp">返回</a>
	</center>
	<br/>
	
	<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#0089cf" border="0" align="center">
	<TR>
	<TD>
	<TABLE cellSpacing="1" cellPadding="4" width="100%" border="0">
	<TR bgColor="#ccccff"></tr>
	<TR bgColor=#ffffff>
	<TD align="left" valign="top" width=<%= request.getParameter("width") %>>

<table width="800" align="center">
<tr><td><FONT face=黑体 color=#0089cf size=4>主题</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>发布时间</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>作者</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>点击数</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>回复数</FONT></td></tr>
<%
	bbs.Op_msg 		show	= new bbs.Op_msg();
	java.util.ArrayList al 		= show.search(request);
	if(al==null){
%>
<jsp:forward page="error.jsp">
	<jsp:param name="msg" value="未知板块" />
</jsp:forward>

<%	
	}
	java.util.Iterator 	it 		= al.iterator();
	while(it.hasNext()){
		bbs.ForumBean 	fb 	= (bbs.ForumBean)it.next();
%>
<tr>
	<td>
	<a href="showaticle.jsp?msgID=<%=fb.getmsgID()%>&PID=<%=fb.getPID()%>&boardID=<%=fb.getboardID()%>">
	<%=fb.gettitle()%>
	</a></td>
	<td><%=fb.getfirstTime()%></td>
	<td><%=fb.getauthor()%></td>
	<td align="center"><%=fb.getclicks()%></td>
	<td align="center"><%=fb.getreplies()%></td>
</tr>
<%	
	}
	
%>

</table>

</center>

<jsp:include page="./include/footer.jsp" flush="true" />