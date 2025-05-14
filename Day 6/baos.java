import  java.io.*;

class baos{
	public static void main(String arg[]){
	try{
		FileOutputStream a=new FileOutputStream("baosfile1.txt");
		FileOutputStream b=new FileOutputStream("baosfile2.txt");
		
		ByteArrayOutputStream c=new ByteArrayOutputStream();
		String s="I am SanjayBalu";
		
		byte barr[]=s.getBytes();
		
		c.write(barr);
		c.writeTo(a);
		c.writeTo(b);
		
		c.flush();
		c.close();
		
		
		}catch(Exception e){};
	}
}
