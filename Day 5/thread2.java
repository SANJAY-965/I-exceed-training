class  sample extends Thread

{
	Thread t=new Thread(this);
    public void run()

	{
		try{
		   for(int i=0;i<5;i++)

			{

			   System.out.println("Child :"+i);

			}
			   t.sleep(1000);   
		}catch(Exception e){}

	}
}
 
class  sample1 extends Thread

{
Thread t=new Thread(this);
	
    public void run()

	{
		try{
		   for(int i=0;i<5;i++)

			{

			   System.out.println("Child :"+i);

			}
			   t.sleep(1000);   
		}catch(Exception e){}

	}
}
 
class thread2

{

     public static void main(String asd[])throws Exception

	{
	    
	    sample obj1=new sample();
	     sample1 obj2=new sample1();
	    obj1.start();
	    obj2.start();
	    

	}

}
 
