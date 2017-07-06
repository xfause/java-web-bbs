<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>

<%
	String submit = request.getParameter("submit");
	
	if(submit!=null&&!"".equals(submit)){
		bbs.Op_user find = new bbs.Op_user();
		int userID=0;
		if((userID=find.finduser(request))>0){
			bbs.OnlineUser ou = new  bbs.OnlineUser();
			boolean online = ou.findUser(request.getParameter("userName"));
			if(online){
				response.sendRedirect("error.jsp?msg=user already in used");
				return;
			}
			
			session.setAttribute("userID",Integer.toString(userID));
			session.setAttribute("userName",request.getParameter("userName"));
			
			int property=0;
			property=find.getproperty(request);
			session.setAttribute("property", property);
			
			response.sendRedirect("showboard.jsp");	
		}
		else{
			out.print("用户不存在");
		}
	}	
%>

<html>
<head>
<style>
a:link{
text-decoration:none;
}
a:hover{
text-decoration=underline;
}
</style>
<title>login</title>

<script lauguage="javascript">


function submitF(param){

	with(document.form1){
		if(param=='login'){
			//test();		
			action = "login.jsp";			
		}
		if('reg'==param){
			action = "reg.jsp";	
		}
		if('admin'==param){
			action = "showban.jsp";
		}

		submit();	
	}

}


function test(){
	if(window.form1.userName.value==""||window.form1.password.value==""){
		alert("输入信息不完整");
		return;
	}
	var ps;
	ps=window.form1.password.value;
	var i;
	for(i=0;i<ps.length;i++){
		x=ps.charCodeAt(i);
		if (x<48 ||x>57){
			alert("只能输入数字");
			window.form1.password.value="";
			break;
		}
	}
	//if(window.form1.email.value.indexOf('@')==-1){
	//	alert("邮箱地址错误");
	
	//}	
	
	
}
</script>
</head>
<body>
	
	
	<jsp:include page="./include/header.jsp" flush="true" />
	<FONT face=Verdana,Arial,Helvetica color=#003366 size=1>
	
	<form name="form1"  action="login.jsp" method="post">
	
	<table name="table1" align="center">
	<tr>
	<td><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>username：</FONT></td><td><input type="text" name="userName" value="go"></td>

	<td><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>&nbsp password&nbsp：</FONT></td><td><input type="password" name="password" value="go"></td>
	
	<td width="20%" align="center"><input type="submit" name="submit"  value="Login" ></td>
	


	</tr>
	
	<tr>
	<td>
	<a href="reg.jsp"><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>register</FONT></a>
	</td>
	</tr>
	<tr>
	<td><a href="index.jsp"><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>back</FONT></a></td>
	</tr>
	</table>


	
	
	</form>
	
	</FONT>
	<jsp:include page="./include/footer.jsp" flush="true" />
	
	
</body>
</html>