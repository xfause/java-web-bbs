<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>
<%--
/**
 * Title:    manageruser.jsp
 * Description:  管理用户

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


<a href="../showboard.jsp">返回</a>
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

<table width="800">
<tr><td width="5%"><FONT face=黑体 color=#0089cf size=4>ID</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>用户名</FONT></td>
<td width="5%"><FONT face=黑体 color=#0089cf size=4>性别</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>手机号</FONT></td>
<td><FONT face=黑体 color=#0089cf size=4>E-mail</FONT></td>
<td align="center"><FONT face=黑体 color=#0089cf size=4>注册时间</FONT></td>
<td align="center"><FONT face=黑体 color=#0089cf size=4>注册IP</FONT></td>
<td align="center"><FONT face=黑体 color=#0089cf size=4>权限</FONT></td>
<td width="5%"></td></tr>
<%
	bbs.Op_user 		show	= new bbs.Op_user();
	java.util.ArrayList al 		= show.showuser(request);
	if(al==null){
		out.println("user的al数组里为空");
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
		bbs.UserBean 	ub 	= (bbs.UserBean)it.next();
		count++;
%>
<tr>
	<td><%=ub.getuserID()%></td>
	<td><%=ub.getuserName()%></td>
	<td><%=ub.getsex()%></td>
	<td><%=ub.getphone()%></td>
	<td><%=ub.getemail()%></td>
	<td align="center"><%=ub.getregTime()%></td>
	<td align="center"><%=ub.getregIP()%></td>
	<td><%if(ub.getproperty()==1){out.print("管理员");}else{out.print("百姓");}%></td>
	<td><a href="deleteuser.jsp?userID=<%=ub.getuserID()%>" 
		onclick="javascript:  return  confirm('是否确认删除本条记录?')">删除</a></td>
	<td><a href="alterauthority.jsp?userID=<%=ub.getuserID()%>&property=<%=ub.getproperty() %>">
		<%if(ub.getproperty()==1){out.print("降职");}else{out.print("升职");}%></a></td>
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
	<a href="manageuser.jsp?curPage=1"><font size=2>首页&nbsp</font></a>
	<a href="manageuser.jsp?curPage=<%=curPage-1 %>"><font size=2>上一页&nbsp</font></a>
	<a href="manageuser.jsp?curPage=<%=curPage+1 %>"><font size=2>下一页&nbsp</font></a>
	<a href="manageuser.jsp?curPage=<%=pageCount %>"><font size=2>尾页&nbsp</font></a>
	<font size=2>第<%=curPage %>页/共<%=pageCount %>页</font>
	<%} %>
</table>

</center>


</center>
<jsp:include page="../include/footer.jsp" flush="true" />