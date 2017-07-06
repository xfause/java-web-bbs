<%@page import="bbs.*" %>
<%
bbs.OnlineUser ou = new bbs.OnlineUser();
int num = ou.getNum();

out.println("在线用户数 : "+num);
java.util.ArrayList al = new java.util.ArrayList();
al = ou.getAl();
java.util.Iterator it = al.iterator();
while(it.hasNext()){
	out.println("用户名 : "+(String)it.next());
}


%>