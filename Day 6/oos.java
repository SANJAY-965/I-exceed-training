import java.io.*;

class student implements Serializable{
	String name;int age;
	  student(String name,int age){
		  this.name=name;
		  this.age=age;
	  }
}

class oos{
	public static void main(String arg[]){
	
	try{
	//Serializable
	student s=new student("Sanju",21);
	FileOutputStream a=new FileOutputStream("oos.txt");
	ObjectOutputStream b=new ObjectOutputStream(a);
	b.writeObject(s);
	b.close(); 
	//DeSerializable
	ObjectInputStream c=new ObjectInputStream(new FileInputStream("oos.txt"));
	student s1=(student)c.readObject();
	System.out.print(s1.name+" "+s1.age);
	}catch(Exception e){}
	}
}
