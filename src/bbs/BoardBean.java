package bbs;


public class BoardBean implements java.io.Serializable {
	private int 	boardID 	= 0;
	private String 	title		= "";
	private String 	content		= "";
	private String 	author		= "";
	private int 	authorID	= 0;

	//boardID
	public void setboardID(int boardID){
		this.boardID = boardID;
	}
	public int getboardID(){
		return boardID;
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
	
	//author
	public void setauthor(String author){
		this.author = author;
	}
	public String getauthor(){
		return author;
	}
	//authorID
	public void setauthorID(int authorID){
		this.authorID = authorID;
	}
	public int getauthorID(){
		return authorID;
	}
	//all
	public void fillAll(java.sql.ResultSet rs) throws java.sql.SQLException{
		
		boardID	= 	rs.getInt("boardID");
		title 	= 	rs.getString("title");
		content	=	rs.getString("content");
		author	=	rs.getString("author");
		boardID	=	rs.getInt("boardID");
	}

}
