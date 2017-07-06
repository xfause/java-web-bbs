
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="bbs.*" %>

<%	
	String submit = request.getParameter("submit");
	int property=0;
	int userID=0;
	if(submit!=null&&!"".equals(submit)){
		bbs.Op_user adduser = new bbs.Op_user();
		String msg = adduser.adduser(request);
		if("ok".equalsIgnoreCase(msg)){
			session.setAttribute("userName",request.getParameter("userName"));
			userID=adduser.getuserID(request);
			session.setAttribute("userID",Integer.toString(userID));
			property=adduser.getproperty(request);
			session.setAttribute("property", property);
			response.sendRedirect("loginsuccess.jsp");
		}
		else{
			response.sendRedirect("error.jsp?msg="+msg);
		}
	}


%>

<html>
<head>
	<title>新用户注册</title>
	
<script language="javascript">

//函数用来确认表单格式
function checkform() {
	if (document.form1.userName.value==""){
		alert("用户名不能为空");
		document.form1.userName.focus();
		return false;
	}
	if (document.form1.password.value==""){
		alert("用户密码不能为空");
		document.form1.password.focus();
		return false;
	}
	if (document.form1.password.value!=document.form1.passconfirm.value){
		alert("确认密码不相符！");
		document.form1.passconfirm.focus();
		return false;
	}
	


	
	return true;
}

</script>


</head>

<body >
<jsp:include page="./include/header.jsp" flush="true" />

<form name="form1" method="post" action="reg.jsp">

    <table  align=center>
    

     <tr height="20%">

     </tr>
      <tr> 
        <td width="171" align="right">
        <FONT face=Verdana,Arial,Helvetica color=#003366 size=2>username：
        </FONT></td>
        <td width="272"> 
          <input type="text" name="userName" maxlength="20" size="14" >
        </td>
      </tr>
      <tr> 
        <td width="171" align="right">
        <FONT face=Verdana,Arial,Helvetica color=#003366 size=2>password：
        </FONT></td>
        <td width="272">
          <input type="password" name="password" maxlength="20" size="14">
        </td>
      </tr>
      <tr> 
        <td width="171" align="right">
        <FONT face=Verdana,Arial,Helvetica color=#003366 size=2>confirm password：
        </FONT></td>
        <td width="272">
          <input type="password" name="passconfirm" maxlength="20" size="14">
        </td>
      </tr>
      <tr> 
        <td width="171" align="right"><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>sex：
        </FONT></td>
        <td width="272">
          <select name="sex">
            <option>male</option>
            <option>female</option>
          </select>
        </td>
      </tr>
      <tr> 
        <td width="171" align="right"><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>phone：
        </FONT></td>
        <td width="272">
          <input type="text" name="phone" maxlength="25" size="14">
        </td>
      </tr>
      <tr> 
        <td width="171" align="right"><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>e-mail：
        </FONT></td>
        <td width="272">
          <input type="text" name="email" maxlength="50" size="14">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">&nbsp; </td>
        <td width="272">
          <input type="submit" name="submit" value="submit" onclick="javascript:return(checkform());">
          <input type="reset" name="reset" value="cancel">
          <a href="index.jsp"><FONT face=Verdana,Arial,Helvetica color=#003366 size=2>back</FONT></a>
        </td>
      </tr>
      
    </table>  
  </form>
  
  <jsp:include page="./include/footer.jsp" flush="true" />
 </body>
</html>
  