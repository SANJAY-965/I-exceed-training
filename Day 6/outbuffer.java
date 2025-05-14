import java.io.*;
class outbuffer{
	public static void main(String arg[]){
	try{
		FileOutputStream a=new FileOutputStream("outbuff.txt");
		BufferedOutputStream b=new BufferedOutputStream(a);
		String c="I am SanjayBalu";
		byte arr[]=c.getBytes();
		b.write(arr);
		b.flush();
		b.close();
		}catch(Exception e){}
	}
}
