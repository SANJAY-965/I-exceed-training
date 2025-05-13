class  sample extends Thread

{
	Thread t=new Thread(this);
    public void run()

	{
		try{
		   for(int i=0;i<10;i++)

			{

			   System.out.println("Child :"+i);

			}
			   //t.sleep(1000);   
		}catch(Exception e){}

	}
}
 
 
class thread

{

     public static void main(String asd[])throws Exception

	{
	    Thread t=Thread.currentThread();
	    sample obj1=new sample();
	    obj1.start();
	    
	    for(int i=0;i<10;i++)

		{

		   System.out.println("Main :"+i);
	           t.sleep(1000);
		 }


	}

}
 
