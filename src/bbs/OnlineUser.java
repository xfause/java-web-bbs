package bbs;
public class OnlineUser {
	private static int num=0;
	private static java.util.ArrayList al = new java.util.ArrayList();
	public int getNum(){
		return num;
	}
	public void setNum(int num){
		this.num = num;
	}
	public java.util.ArrayList getAl(){
		return al;
	}
	public void addUser(String userName){
		al.add(userName);
		num++;
	}
	public void delUser(String userName){
		al.remove(al.size()-1);
		
	}
	public boolean findUser(String userName){
		if(al.indexOf(userName)>=0){
			return true;
		}
		else{
			return false;
		}
	}
	 
}

