<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    altermsg.jsp
 * Description:  管理员编辑文章

 */
--%>

<%--
/**
<a href="addmsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">发表文章</a>
<a href="/admin/altermsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">编辑文章</a>
 */
--%>
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


<a href="../showmsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">返回</a>
</center>
<br/>
<center>

<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#0089cf" border="0" align="center">
	<TR>
	<TD>
	<TABLE cellSpacing="1" cellPadding="4" width="100%" border="0">
	<TR bgColor="#ccccff"></tr>
	<TR bgColor=#ffffff>
	<TD align="left" valign="top" width=<%= request.getParameter("width") %>>

<table width="800" align="center">
<tr><td width="5%"><FONT face=黑体 color=#0089cf size=4>状态</FONT></td>
<td align="center"><FONT face=黑体 color=#0089cf size=4>标题</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>发布时间</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>作者</FONT></td>
<td width="10%" align="center"><FONT face=黑体 color=#0089cf size=4>点击数</FONT></td>
<td width="10%" align="center"><FONT face=黑体 color=#0089cf size=4>回复数</FONT></td>
<td width="5%"></td>
<td width="5%"></td>
<td width="5%"></td>
</tr>
<%
	bbs.Op_msg 		show	= new bbs.Op_msg();
	java.util.ArrayList al 		= show.showmsg(request);
	if(al==null){
%>
<jsp:forward page="../error.jsp">
	<jsp:param name="msg" value="未知板块" />
</jsp:forward>

<%	
	}
	java.util.Iterator 	it 		= al.iterator();
%>

	<%
		while(it.hasNext()){
			bbs.ForumBean 	fb 	= (bbs.ForumBean)it.next();
	%>
	<tr>
		<td><%if(fb.getflag()==1){%>top<%}%></td>
		<td align="center">
		<a href="../showaticle.jsp?msgID=<%=fb.getmsgID()%>&PID=<%=fb.getPID()%>&boardID=<%=fb.getboardID()%>">
		<%=fb.gettitle()%>
		</a></td>
		<td><%=fb.getfirstTime()%></td>
		<td><%=fb.getauthor()%></td>
		<td align="center"><%=fb.getclicks()%></td>
		<td align="center"><%=fb.getreplies()%></td>
		<td><a href="altertop.jsp?msgID=<%=fb.getmsgID()%>&boardID=<%=request.getParameter("boardID")%>
		&flag=<%=fb.getflag()%>">
		<%if(fb.getflag()==1){out.print("取消置顶");}else{out.print("置顶");}%></a></td>
		<td><a href="deletemsg.jsp?msgID=<%=fb.getmsgID()%>&boardID=<%=request.getParameter("boardID")%>" 
		onclick="javascript:  return  confirm('是否确认删除本条记录?')">删除</a></td>
		<td><a href="transfermsg.jsp?msgID=<%=fb.getmsgID()%>&boardID=<%=request.getParameter("boardID")%>" 
		>转移</a></td>
	</tr>
	<%	
		}
		
	%>
</form>

</table>

</center>
