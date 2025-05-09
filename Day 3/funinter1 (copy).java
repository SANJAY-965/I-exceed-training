@FunctionalInterface
interface demofun
{
    public void showme();
 
}
 
class funinter1
{
    public static void main(String[] args) {
        new demofun(){
            @Override
	    public void showme()
	    {
		System.out.println("functional interface");
	    }
        }.showme();
    }
   
}
