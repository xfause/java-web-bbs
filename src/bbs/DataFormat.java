package bbs;

/**
 * <p>负责字符串的处理 </p>
 */
import java.lang.*;
import java.util.*;

public class DataFormat implements java.io.Serializable{
  public DataFormat() {  }
  /**
   * 把字符串转换成适合于网页显示的文本
   * @param s
   * @return
   */
  public static String toHtml(String s) {
     if (s==null) return s;
     String str = new String(s);
     //str=strReplace(str,"\n","<br>");
     str=strReplace(str,"&","&amp;");
     str=strReplace(str,"<","&lt;");
     str=strReplace(str,">","&gt;");
     str=strReplace(str,"\"","&quot;");
     
     return str;
   }
   /**
    * 把字符串sBody中的sFrom用sTo替换
    * @param sBody
    * @param sFrom
    * @param sTo
    * @return
    */
   public static String strReplace(String sBody, String sFrom, String sTo) {
      int i,j,k,l;
      if (sBody==null || sBody.equals("")) return "";
      i = 0;
      j = sFrom.length();
      k = sTo.length();
      StringBuffer sss = new StringBuffer(sBody.length());
      boolean bFirst=true;
      l = i;
      while (sBody.indexOf(sFrom,i)!=-1) {
        i = sBody.indexOf(sFrom,i);
        sss.append(sBody.substring(l,i));
        sss.append(sTo);
        i += j;
        l = i;
      }
      sss.append(sBody.substring(l));
      return sss.toString();
    }

 
      /**
     * 将普通字符串格式化成数据库认可的字符串格式
     *
     * @param str 要格式化的字符串
     * @return 合法的数据库字符串
     */
    public static String toSql(String str) {
        str = strReplace(str, "'", "''");
        return str;
    }
      /**
     * 将普通字符串一次进行所有格式化
     *
     * @param str 要格式化的字符串
     * @return 合法的数据库字符串
     */
     public static String parseAll(String body){
     	
     	String toStr = new String(body);
     	toStr = DataFormat.toHtml(toStr);
     	toStr = DataFormat.toSql(toStr);
     	return toStr;
     }
	 	    
}