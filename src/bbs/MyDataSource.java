package bbs;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.logging.Logger;
import java.io.PrintWriter;

public class MyDataSource implements DataSource 
{
   private int LoginTimeout;
   private PrintWriter pw;
   public Connection getConnection() throws SQLException 
   {
      try 
      {
         Class.forName("org.gjt.mm.mysql.Driver").newInstance();
         java.util.Properties po = new java.util.Properties();
         //po.put("user", "root");
         //po.put("password", "");
         return java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?user=root&useUnicode=true&characterEncoding=GBK");
      }
      catch(java.lang.ClassNotFoundException cex) 
      {
         throw new SQLException(cex.getMessage());
      }
      catch(java.lang.InstantiationException iex) 
      {
         throw new SQLException(iex.getMessage());
      }
      catch(java.lang.IllegalAccessException iiex) 
      {
         throw new SQLException(iiex.getMessage());
      }
   }
   public Connection getConnection(String parm1, String parm2) throws SQLException 
   {
      try 
      {
         Class.forName("net.sourceforge.jtds.jdbc.Driver").newInstance();
         java.util.Properties po = new java.util.Properties();
         //po.put("user", "sa");
         //po.put("password", "sa");
         return java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?user=root&useUnicode=true&characterEncoding=GBK");
      }
      catch(java.lang.ClassNotFoundException cex) 
      {
         throw new SQLException(cex.getMessage());
      }
      catch(java.lang.InstantiationException iex) 
      {
         throw new SQLException(iex.getMessage());
      }
      catch(java.lang.IllegalAccessException iiex) 
      {
         throw new SQLException(iiex.getMessage());
      }
   }
   public PrintWriter getLogWriter() throws SQLException 
   {
      System.out.println("getLogWriter");
      return pw;
   }
   public int getLoginTimeout() throws SQLException 
   {
      System.out.println("getLoginTimeout");
      return LoginTimeout;
   }
   public void setLogWriter(PrintWriter parm1) throws SQLException 
   {
      System.out.println("setLogWriter");
      pw = parm1;
   }
   public void setLoginTimeout(int parm1) throws SQLException 
   {
      System.out.println("setLoginTimeout");
      LoginTimeout = parm1;
   }
@Override
public <T> T unwrap(Class<T> iface) throws SQLException {
	// TODO Auto-generated method stub
	return null;
}
@Override
public boolean isWrapperFor(Class<?> iface) throws SQLException {
	// TODO Auto-generated method stub
	return false;
}
@Override
public Logger getParentLogger() throws SQLFeatureNotSupportedException {
	// TODO Auto-generated method stub
	return null;
}
}

