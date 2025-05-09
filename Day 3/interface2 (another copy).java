interface one
 {
    String name="sanju";
    public void display();
    
 }

 interface two extends one
 {
    int age=21;
    public void display();
    
 }
  class demo implements two
  {
  
    public void display(){System.out.println(name+" "+age);}
    //public void display1(){System.out.println("display1");}
  }
 
  class interface2
  {
    public static void main(String[] args) {
        demo ob=new demo();
        ob.display();
  }
  }
