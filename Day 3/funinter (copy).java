//@FunctionalInterface
interface demofunctional
{

    public void showme();
 	public void showme(String name);
}
 
class funinter implements demofunctional
{
    public static void main(String[] args) {
        funinter obj=new funinter();
        obj.showme();obj.showme("s");
    }
    @Override
    public void showme()
    {
        System.out.println("functional interface");
    }
    public void showme(String name)
    {
        System.out.println("functional interface  "+name);
    }
}
