import java.io.*;

class convert1{
	//DataInputStream in=new DataInputStream(System.in);
	BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
	convert1(){
		try{
			int a=Integer.valueOf(in.readLine()).intValue();
			float b=Float.valueOf(in.readLine()).floatValue();
		
			System.out.println(a+b);
		}
		catch (IOException e)
		{
            	System.out.println("An error occurred: " + e.getMessage());
            	}
	}
	
}

class convert{
 	public static void main(String arg[]){
 		new convert1();
 	}
}
