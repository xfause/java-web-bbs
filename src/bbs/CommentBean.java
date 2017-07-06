package bbs;
import java.io.Serializable;

public class CommentBean implements Serializable {
	private int 	commentID	=0;
	private String 	title		="";
	private String 	content		="";
	private String 	time		="";
	private String 	userName	="";
	private int 	userID		=0;


	//commentID
	public int getcommentID(){
		return commentID;
	}
	
	public void setcommentID(int commentID){
		this.commentID=commentID;
	}
		
	//title
	public void settitle(String title){
		this.title = title;
	}
	public String gettitle(){
		return title;
	}
	
	//content
	public void setcontent(String content){
		this.content = content;
	}
	public String getcontent(){
		return content;
	}

	//time
	public void settime(String time){
		this.time = time;
	}
	public String gettime(){
		return time;
	}
	
	
	
	//user
	public void setuserName(String userName){
		this.userName = userName;
	}
	public String getuserName(){
		return userName;
	}
	
	//userID
	public void setuserID(int userID){
		this.userID = userID;
	}
	public int getuserID(){
		return userID;
	}

	
	//all
	public void fillAll(java.sql.ResultSet rs) throws java.sql.SQLException{
	
		commentID	=rs.getInt("commentID");
		title		=rs.getString("title");
		content		=rs.getString("content");
		time		=rs.getString("time");
		userName	=rs.getString("userName");
		userID		=rs.getInt("userID");
	}
}
