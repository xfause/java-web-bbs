package bbs;

import java.sql.*;
import java.io.*;
import javax.sql.*;
import javax.naming.*;

public class DataBase 
{
   private Connection conn = null;
   private Statement stmt = null;
   public DataBase () 
   {
      try 
      {
         //conn = (CP.ConnPool.getInstance()).getConnection();
    	  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          java.util.Properties po = new java.util.Properties();
          //po.put("user", "root");
          //po.put("password", "");
          conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?user=root&password=123456&useUnicode=true&characterEncoding=UTF8");
         stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      }
      catch(Exception ex) 
      {
         ex.printStackTrace();
      }
   }
   public Connection getconn(){
   	return this.conn;
   }
   public ResultSet executeQuery(String sql) throws SQLException 
   {
      return stmt.executeQuery(sql);
   }
   public boolean executeUpdate(String sql) throws SQLException 
   {
      boolean bupdate = false;
      int rowCount = stmt.executeUpdate(sql);
      //如果不成功，bupdate就会返回0
      if(rowCount != 0) 
         bupdate = true;
      return bupdate;
   }
   /**
    * ISO8859ToGBK
    * @param s8859 String
    * @return String
    */
   public static String ISO8859ToGBK(String s8859) 
   {
      String back = null;
      if(s8859 != null) 
      {
         try 
         {
            byte abyte0[] = s8859.getBytes("GBK");
            back = new String(abyte0);
         }
         catch(Exception e) 
         {
         }
      }
      else 
         back = "";
      return back;
   }
   /**
    * GBKToISO8859
    * @param sk String
    * @return String
    */
   public static String GBKToISO8859(String sk) 
   {
      String back = null;
      if(sk != null) 
      {
         try 
         {
            byte abyte0[] = sk.getBytes("8859_1");
            back = new String(abyte0);
         }
         catch(Exception e) 
         {
         }
      }
      else 
         back = "";
      return back;
   }
   public void Commit() throws SQLException
   {
      if(conn != null) 
         conn.commit();
   }
   public void RollBack() throws SQLException
   {
      if(conn != null) 
         conn.rollback();
   }
   public void free() 
   {
      try 
      {
         if(conn != null) 
            conn.close();
      }
      catch(Exception ex) 
      {
      }
   }
}

