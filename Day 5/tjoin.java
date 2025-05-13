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
 
 
class tjoin

{

     public static void main(String asd[])throws Exception

	{
	    //Thread t=Thread.currentThread();
	    sample obj1=new sample();
	    sample obj2=new sample();
	    sample obj3=new sample();
	    obj1.start();
	    obj1.join();
	    obj2.start();
	    obj2.join();
	    obj3.start();
	    
	}

}
 
