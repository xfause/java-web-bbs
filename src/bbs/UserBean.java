package bbs;
import java.io.Serializable;

public class UserBean implements Serializable {
	private int 	userID		=0;
	private String 	userName	="";
	private String 	password	="";
	private String 	sex			="";
	private String	phone		="";
	private String	email		="";
	private String	regTime		="";
	private String	regIP		="";
	private int		property	=0;
	
	//property
	public int getproperty(){
		return property;
	}
	
	//userID
	public int getuserID(){
		return userID;
	}
	//userName
	public void setuserName(String userName){
		this.userName = userName;
	}
	public String getuserName(){
		return userName;
	}
	//	password
	public void setpassword(String password){
		this.password = password;
	}
	public String getpassword(){
		return password;
	}	
	//sex	
	public void setsex(String sex){
		this.sex = sex;
	}
	
	public String getsex(){
		return sex;
	}	
	//phone	
	public void setphone(String phone){
		this.phone = phone;
	}
	
	public String getphone(){
		return phone;
	}
	//	email
	public void setemail(String email){
		this.email = email;
	}
	public String getemail(){
		return email;
	}	
	//regTime
	public void setregTime(String regTime){
		this.regTime = regTime;
	}
	public String getregTime(){
		return regTime;
	}	
	//regIP
	public void setregIP(String regIP){
		this.regIP = regIP;
	}
	public String getregIP(){
		return regIP;
	}
	
	//all
	public void fillAll(java.sql.ResultSet rs) throws java.sql.SQLException{
	
		userID		=rs.getInt("userID");
		userName	=rs.getString("userName");
		sex			=rs.getString("sex");
		phone		=rs.getString("phone");
	 	email		=rs.getString("email");
		regTime		=rs.getString("regTime");
		regIP		=rs.getString("regIP");
		property	=rs.getInt("property");
	 	
	}
}
