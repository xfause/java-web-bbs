package bbs;
import java.util.ArrayList;

import bbs.*;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class Op_board  implements java.io.Serializable{

	String sqlStr = "";
	Connection conn = null;
	PreparedStatement pstmt = null;

	
	//添加记录
	public boolean addBoard(javax.servlet.http.HttpServletRequest request,javax.servlet.http.HttpSession session) throws Exception{
		sqlStr = "insert into boardinfo (title,content,author) values(?,?,?)";
		DataBase db = new DataBase();
		conn 		= db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setString(1,request.getParameter("title"));
		pstmt.setString(2,request.getParameter("content"));
		pstmt.setString(3,(String)session.getAttribute("userName"));
		pstmt.executeUpdate();
		db.free();
    	return true;

	}
	//取出全部记录
	public ArrayList showBoard() throws Exception,java.sql.SQLException{
		
			System.out.println ("动态sql-----------");
		sqlStr = "select * from boardinfo";
		
		java.util.ArrayList al = new java.util.ArrayList();
		DataBase db = new DataBase();
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()){
			BoardBean bb = new BoardBean();			
			bb.fillAll(rs);
			al.add(bb);
		}
		db.free();
		return al;
	}
	
	//取出一条记录
	public BoardBean showOneBoard(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		
		sqlStr = "select * from boardinfo where boardID= ?";
		
		BoardBean bb = new BoardBean();
		DataBase db = new DataBase();
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("boardID")));
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			System.out.println ("rs has next");
			bb.fillAll(rs);		
		}

		db.free();
		return bb;
	}
	
	//修改记录
	public boolean alterBoard(javax.servlet.http.HttpServletRequest request) 
		throws Exception {
		sqlStr = "update  boardinfo set title= ?,content= ? where boardID= ?";
		DataBase db = new DataBase();
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setString(1,request.getParameter("title"));
		pstmt.setString(2,request.getParameter("content"));
		pstmt.setInt(3,Integer.parseInt(request.getParameter("boardID")));
		pstmt.executeUpdate();
		db.free();
		return true;

	}

	//删除记录
	public boolean deleteBoard(javax.servlet.http.HttpServletRequest request)
		throws Exception{
		sqlStr = "delete from boardinfo where boardID = ?";
		DataBase db = new DataBase();	
		conn = db.getconn();
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1,Integer.parseInt(request.getParameter("boardID")));
		pstmt.executeUpdate();
		db.free();
	  	return true;
	}

}
