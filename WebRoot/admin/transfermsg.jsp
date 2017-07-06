<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    transfermsg.jsp
 * Description:  转移帖子

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


<a href="altermsg.jsp?boardID=<%=request.getParameter("boardID")%>&PID=0&msgID=0">返回</a>
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

<center>
<table  width="800">
<tr><td>当前板块号为：<%= request.getParameter("boardID") %></td></tr>
<tr><td><FONT face=黑体 color=#0089cf size=4>转移的板块</FONT></td>
<td></td></tr>
<%
	//out.print(session.getAttribute("userID"));
	bbs.Op_board show = new bbs.Op_board();
	java.util.ArrayList al= show.showBoard();
	
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
		bbs.BoardBean bb = (bbs.BoardBean)it.next();
		count++;
%>
<tr>
	<td><%=bb.getboardID() %></td>
	<td><%=bb.gettitle()%></td>
	<td><a href="transfersuccess.jsp?boardID=<%=bb.getboardID()%>
	&msgID=<%=request.getParameter("msgID")%>">转移</a></td>
</tr>
<%	
	}
	
%>

<tr></tr>

</table>
<br/>
<center>
<table>
	<a href="transfermsg.jsp?curPage=1&msgID=<%=request.getParameter("msgID")%>
	&boardID=<%=request.getParameter("boardID")%>"><font size=2>首页&nbsp</font></a>
	<a href="transfermsg.jsp?curPage=<%=curPage-1 %>&msgID=<%=request.getParameter("msgID")%>
	&boardID=<%=request.getParameter("boardID")%>"><font size=2>上一页&nbsp</font></a>
	<a href="transfermsg.jsp?curPage=<%=curPage+1 %>&msgID=<%=request.getParameter("msgID")%>
	&boardID=<%=request.getParameter("boardID")%>"><font size=2>下一页&nbsp</font></a>
	<a href="transfermsg.jsp?curPage=<%=pageCount %>&msgID=<%=request.getParameter("msgID")%>
	&boardID=<%=request.getParameter("boardID")%>"><font size=2>尾页&nbsp</font></a>
	<font size=2>第<%=curPage %>页/共<%=pageCount %>页</font>
</table>
</center>




</center>
<jsp:include page="../include/footer.jsp" flush="true" />