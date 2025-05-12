interface one
 {
    public void display();
    public void display2(){System.out.println("display");}
 }
 
 interface two extends one
  {
    public void display1();
  }
 
  class demo implements one
  {
    public void display(){System.out.println("display");}
    public void display1(){System.out.println("display1");}
  }
 
  class interface1
  {
    public static void main(String[] args) {
        demo ob=new demo();
        ob.display();
        ob.display1();ob.display2();
    }
  }
