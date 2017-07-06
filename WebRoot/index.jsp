<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>首页</title>


  </head>
  
  <body>

  <jsp:include page="./include/header.jsp" flush="true" />

	<table>
		<FONT face=Verdana,Arial,Helvetica color=#003366 size=2>
		<tr> 
		<td width="50%" height="0" align="right" valign="top">
			<td width="50%" height="0" align="left" valign="top" ><a href="login.jsp" >
			<FONT face=Verdana,Arial,Helvetica color=#003366 size=2>login
			</FONT></a></td>
			
		</tr>
		<tr height="10%"></tr>
		<tr> 
		<td width="50%" height="0" align="right" valign="top">
			<td width="50%" height="0" align="left" valign="top"><a href="reg.jsp">
			<FONT face=Verdana,Arial,Helvetica color=#003366 size=2>register
			</FONT></a></td>
			
		</tr>
		<tr height="10%"></tr>
		<tr> 
		<td width="50%" height="0" align="right" valign="top">
			<td width="50%" height="0" align="left" valign="top"><a href="showboard.jsp">
			<FONT face=Verdana,Arial,Helvetica color=#003366 size=2>visiting as no login
			</FONT></a></td>
			
		</tr>
	
		</FONT>
	</table>

	<jsp:include page="./include/footer.jsp" flush="true" />
	
		
	</body>
	
	
	</html>
