class thread3{
	public static void main(String arg[]){
	Thread t=Thread.currentThread();
		new Thread(){
			public void run(){
		try{
				for(int i=0;i<5;i++){
				System.out.println("t1 "+i);
				t.sleep(2000);
				}
			}catch(Exception e){}
			}
		}.start();
		
		new Thread(){
			public void run(){
		try{
				for(int i=0;i<5;i++){
				System.out.println("t2 "+i);
				t.sleep(2000);
				}
			}catch(Exception e){}
			}
		}.start();
		
	}
}
