package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bbs.*;

public class Op_msg  implements java.io.Serializable{

	String sqlStr="";
	String sqlStr1="";
	String sqlStr2="";
	Connection conn = null;
	PreparedStatement pstmt = null;

	//发表文章
	public String addmsg(javax.servlet.http.HttpServletRequest request,javax.servlet.http.HttpSession session)
		throws Exception {

		if(request.getParameter("PID")==null){
			return "缺少所属主题信息";	
		}
		if(request.getParameter("boardID")==null){
			return "缺少所属板块信息";
		}
		if(session.getAttribute("userID")==null){
			return "用户ID为空,请登陆";
		}
		
		if(session.getAttribute("userName")==null){
			return "用户名为空,请登陆";
		}
		DataBase db = new DataBase();
		conn = db.getconn();
		if(Integer.parseInt(request.getParameter("PID"))!=0){
			sqlStr = "select replies from foruminfo where msgID = ?";
			pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1,Integer.parseInt(request.getParameter("PID")));
			java.sql.ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				int replies = rs.getInt("replies");
				rs.close();
				sqlStr = "update foruminfo set replies = ? where msgID = ?";
				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setInt(1,replies+1);
				pstmt.setInt(2,Integer.parseInt(request.getParameter("PID")));
				pstmt.executeUpdate();
			}
			
		}
		sqlStr = "insert into foruminfo (PID,title,content,author,boardID,authorID,firstTime,authorIP,clicks,replies)values ("
		+"?,?,?,?,?,?,now(),?,0,0)";
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("PID")));
		pstmt.setString(2,request.getParameter("title"));
		System.out.println("---content=" + request.getParameter("content"));
		pstmt.setString(3,request.getParameter("content"));
		pstmt.setString(4,(String)session.getAttribute("userName"));
		pstmt.setInt(5,Integer.parseInt(request.getParameter("boardID")));
		
		pstmt.setInt(6,Integer.parseInt((String)session.getAttribute("userID")));
		pstmt.setString(7,request.getRemoteAddr());
		
    	pstmt.executeUpdate();
    	db.free();
    	return "ok";

	}
	
	//列出板块内所有文章
	public java.util.ArrayList showmsg(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		if(request.getParameter("boardID")==null){
				return null;
		}
		sqlStr = "select * from forumInfo where boardID =? and PID=0 order by flag desc, msgID desc";
		java.util.ArrayList al = new java.util.ArrayList();
		DataBase db = new DataBase();
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("boardID")));
		java.sql.ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			ForumBean fb = new ForumBean();
			fb.fillAll(rs);
			al.add(fb);
		}
		db.free();
		return al;
	}
	
	//查询
	public java.util.ArrayList search(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		String key = new String(request.getParameter("key").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("************"+key);
		sqlStr = "select * from foruminfo where content like '%"+key+"%'";
		java.util.ArrayList al = new java.util.ArrayList();
		DataBase db = new DataBase();
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		//pstmt.setString(1,request.getParameter("key"));
		java.sql.ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			ForumBean fb = new ForumBean();
			fb.fillAll(rs);
			al.add(fb);
		}
		db.free();
		return al;
	}
	
	//列出文章中所有的帖子
	public java.util.ArrayList showAticle(javax.servlet.http.HttpServletRequest request)
		throws Exception {
		if(request.getParameter("msgID")==null){
			return null;
		}
		

		sqlStr = "select clicks from foruminfo where msgID=?";
		java.util.ArrayList al = new java.util.ArrayList();		
		DataBase db = new DataBase();
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("msgID")));
		java.sql.ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			int clicks = rs.getInt("clicks");
			sqlStr = "update foruminfo set clicks= ? where msgID= ? ";
			pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1,clicks+1);
			pstmt.setInt(2,Integer.parseInt(request.getParameter("msgID")));
			
			pstmt.executeUpdate();
		}
		sqlStr = "select * from foruminfo where msgID= ? or PID = ?";
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("msgID")));
		pstmt.setInt(2,Integer.parseInt(request.getParameter("msgID")));
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			ForumBean fb = new ForumBean();
			fb.fillAll(rs);
			al.add(fb);
		}
				
		db.free();
		return al;
	}
	
	//转移帖子
	public boolean transfersuccess(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		DataBase db = new DataBase();	
		conn = db.getconn();
		sqlStr1 = "update foruminfo set boardID = ? where msgID = ?";
		sqlStr2 = "update foruminfo set boardID = ? where PID = ?";
		pstmt = conn.prepareStatement(sqlStr1);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("boardID")));
		pstmt.setInt(2,Integer.parseInt(request.getParameter("msgID")));
		if(pstmt.executeUpdate()==0){
			return false;
		}
		pstmt = conn.prepareStatement(sqlStr2);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("boardID")));
		pstmt.setInt(2,Integer.parseInt(request.getParameter("msgID")));
		pstmt.executeUpdate();
		
		db.free();
	  	return true;
	}
	
	//置顶和取消置顶
	public boolean altertop(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		DataBase db = new DataBase();	
		conn = db.getconn();
		if(Integer.parseInt(request.getParameter("flag"))==1){
			//取消置顶
			sqlStr = "update foruminfo set flag = 0 where msgID = ?";
		}
		else{
			//置顶
			sqlStr = "update foruminfo set flag = 1 where msgID = ?";
		}
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("msgID")));
		pstmt.executeUpdate();
		db.free();
	  	return true;
	}
	
	//删除记录
	public boolean deletemsg(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		sqlStr = "delete from foruminfo where msgID = ?";
		DataBase db = new DataBase();	
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("msgID")));
		pstmt.executeUpdate();
		db.free();
	  	return true;
	}
		
}
