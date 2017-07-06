<%@page contentType="text/html;charset=UTF-8"
pageEncoding="utf-8" %>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    showboard.jsp
 * Description:  显示信息页面
 */
--%>
<body>
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
	
	<%if(session.getAttribute("property").equals(Integer.parseInt("1"))){ %>
	<a href="/girl-bbs/admin/manageuser.jsp">管理用户</a>
	
	<a href="/girl-bbs/admin/showcomment.jsp">查看留言</a>
	<%} %>
	
	<a href="comment.jsp">给我们留言</a>
	
	<%} %>
	
	<%!
	
		public static final int PAGESIZE=5;
		int pageCount;
		int curPage=1;
	
	 %>
	
	
	
	<form action="search.jsp" method="get">
  	<b>关键字</b> <input type="text" name="key" />
  	<input type="submit" value="查询" />
	</form>

	<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#0089cf" border="0" align="center">
	<TR>
	<TD>
	<TABLE cellSpacing="1" cellPadding="4" width="100%" border="0">
	<TR bgColor="#ccccff"></tr>
	<TR bgColor=#ffffff>
	<TD align="left" valign="top" width=<%= request.getParameter("width") %>>
	
<table  border="0" width="800" align="center">
	<tr><td><FONT face=黑体 color=#0089cf size=4><b>板块名</b></FONT></td>
	<td><FONT face=黑体 color=#0089cf size=4><b>板块简介</b></FONT></td>
	<td><FONT face=黑体 color=#0089cf size=4><b>板块作者</b></FONT></td>
	<td><a href="/girl-bbs/admin/addboard.jsp">添加板块</a></td></tr>
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
	<td><a href="showmsg.jsp?boardID=<%=bb.getboardID()%>"><%=bb.gettitle()%></a></td>
	<td><%=bb.getcontent()%></td>
	<td><%=bb.getauthor()%></td>
	<td><a href="/girl-bbs/admin/alterboard.jsp?boardID=<%=bb.getboardID()%>">修改</a></td>
	<td><a href="/girl-bbs/admin/deleteboard.jsp?boardID=<%=bb.getboardID()%>" 
	onclick="javascript:  return  confirm('是否确认删除本条记录?')">删除</a></td>
</tr>
<%	
	}
	
%>
<tr></tr>

</table>
<br/>
<center>
<table >
	<%if(pageCount!=1) {%>
	<a href="showboard.jsp?curPage=1"><font size=2>首页&nbsp</font></a>
	<a href="showboard.jsp?curPage=<%=curPage-1 %>"><font size=2>上一页&nbsp</font></a>
	<a href="showboard.jsp?curPage=<%=curPage+1 %>"><font size=2>下一页&nbsp</font></a>
	<a href="showboard.jsp?curPage=<%=pageCount %>"><font size=2>尾页&nbsp</font></a>
	<font size=2>第<%=curPage %>页/共<%=pageCount %>页</font>
	<%} %>
</table>
</center>



</center>
<jsp:include page="./include/footer.jsp" flush="true" />
</body>