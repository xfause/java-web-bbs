package bbs;
import java.io.Serializable;

public class ForumBean implements Serializable {
	private int 	msgID		=0;
	private String 	title		="";
	private String 	content		="";
	private String 	firstTime	="";
	private String 	lastTime	="";
	private String 	author		="";
	private int 	PID			=0;
	private int 	boardID		=0;
	private int 	authorID	=0;
	private int 	clicks		=0;
	private int		replies		=0;
	private int     flag        =0;

	//msgID
	public int getmsgID(){
		return msgID;
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

	//firstTime
	public void setfirstTime(String firstTime){
		this.firstTime = firstTime;
	}
	public String getfirstTime(){
		return firstTime;
	}
	//lastTime
	public void setlastTime(String lastTime){
		this.lastTime = lastTime;
	}
	public String getlastTime(){
		return lastTime;
	}
	
	//author
	public void setauthor(String author){
		this.author = author;
	}
	public String getauthor(){
		return author;
	}

	//PID
	public void setPID(int PID){
		this.PID = PID;
	}
	public int getPID(){
		return PID;
	}
	
	//boardID
	public void setboardID(int boardID){
		this.boardID = boardID;
	}
	public int getboardID(){
		return boardID;
	}
	
	//authorID
	public void setauthorID(int authorID){
		this.authorID = authorID;
	}
	public int getauthorID(){
		return authorID;
	}
	
	//clicks
	public void setclicks(int clicks){
		this.clicks = clicks;
	}
	public int getclicks(){
		return clicks;
	}
	
	//replies
	public void setreplies(int replies){
		this.replies = replies;
	}
	public int getreplies(){
		return replies;
	}
	
	//flag
	public int getflag(){
		return flag;
	}
	
	//all
	public void fillAll(java.sql.ResultSet rs) throws java.sql.SQLException{
	
		msgID		= rs.getInt("msgID");
		title		=rs.getString("title");
		content		=rs.getString("content");
		firstTime	=rs.getString("firstTime");
	 	lastTime	=rs.getString("lastTime");
		author		=rs.getString("author");
		PID			=rs.getInt("PID");
	 	boardID		=rs.getInt("boardID");
		authorID	=rs.getInt("authorID");
		clicks		=rs.getInt("clicks");
		replies		=rs.getInt("replies");
		flag        =rs.getInt("flag");
	}
}
