<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    showmsg.jsp
 * Description:  显示文章

 */
--%>
<style>
a:link{
text-decoration:none;
}
a:hover{
text-decoration=underline;
}
</style>
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
	
	<a href="addmsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">发表文章</a>
	<a href="/girl-bbs/admin/altermsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">编辑文章</a>
	
<%} %>


<a href="showboard.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">返回</a>
</center>
<br/>

<%!
	
		public static final int PAGESIZE=5;
		int pageCount;
		int curPage=1;
	
	 %>

<center>

<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#0089cf" border="0" align="center">
	<TR>
	<TD>
	<TABLE cellSpacing="1" cellPadding="4" width="100%" border="0">
	<TR bgColor="#ccccff"></tr>
	<TR bgColor=#ffffff>
	<TD align="left" valign="top" width=<%= request.getParameter("width") %>>

<table width="800" align="center">
<tr><td><FONT face=黑体 color=#0089cf size=4>主题</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>发表时间</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>作者</FONT></td>
<td align="center"><FONT face=黑体 color=#0089cf size=4>点击数</FONT></td>
<td align="center"><FONT face=黑体 color=#0089cf size=4>回复数</FONT></td></tr>
<%
	bbs.Op_msg 		show	= new bbs.Op_msg();
	java.util.ArrayList al 		= show.showmsg(request);
	if(al==null){
%>
<jsp:forward page="error.jsp">
	<jsp:param name="msg" value="未知板块" />
</jsp:forward>

<%	
	}
	
	//得到共有几行记录
	int size = al.size();
	pageCount=(size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
	String temp=request.getParameter("curPage");
	if(temp==null){
		temp="1";
	}
	curPage=Integer.parseInt(temp);
	int count=0;
	java.util.Iterator it =al.iterator();
	//把迭代器调到需要当前页面的第一条需要显示的位置
	for(int i=0;i<((curPage-1)*PAGESIZE);i++){
		it.next();
	}
	
	while(it.hasNext()){
		if(count>=PAGESIZE)break;
		bbs.ForumBean 	fb 	= (bbs.ForumBean)it.next();
		count++;
%>
<tr>
	<td>
	<%if(fb.getflag()==1){ %>
	<font color="red">[top]</font>
	<%} %>
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

<tr></tr>
</table>
<br/>
<center>
<table>
	<%if(pageCount!=1) {%>
	<a href="showmsg.jsp?curPage=1&boardID=<%=request.getParameter("boardID")%>"><font size=2>首页&nbsp</font></a>
	<a href="showmsg.jsp?curPage=<%=curPage-1 %>&boardID=<%=request.getParameter("boardID")%>"><font size=2>上一页&nbsp</font></a>
	<a href="showmsg.jsp?curPage=<%=curPage+1 %>&boardID=<%=request.getParameter("boardID")%>"><font size=2>下一页&nbsp</font></a>
	<a href="showmsg.jsp?curPage=<%=pageCount %>&boardID=<%=request.getParameter("boardID")%>"><font size=2>尾页&nbsp</font></a>
	<font size=2>第<%=curPage %>页/共<%=pageCount %>页</font>
	<%} %>
</table>
</center>



</center>
<jsp:include page="./include/footer.jsp" flush="true" />