class sample extends Thread

{

    Thread t=new Thread(this);

    public void run()

	{

	  t.setName("Child thread");

	  System.out.println("Name of the thread\t"+t.getName());	

	  System.out.println(t.getPriority());

	}

}
 
 
class thread1

{

    public static void main(String ads[])

	{

	    new sample().start();

	    Thread t=Thread.currentThread();

	    t.setName("Main thread");

	    System.out.println(t.getName());

	    System.out.println(t.getPriority());

	}

}
 
