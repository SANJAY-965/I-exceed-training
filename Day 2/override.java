class A
{
    public void display()
    {
        System.out.println("super class method");
    }
 
}
class B extends A
{
    public void display()
    {
        System.out.println("Derived class method");
    }
}
 
class override{
    public static void main(String asd[])
    {
        A ref;
        A obja=new A();
        B objb=new B();
        ref=objb;
        ref.display();
    }
}
