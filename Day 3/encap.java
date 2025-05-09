class student
{
   private  String name;
   private  int age;
   private String city;
 
   public void setName(String name)
   {
    this.name=name;
   }
   
   public void setAge(int age)
   {
    this.age=age;
   }
   public void setCity(String city)
   {
    this.city=city;
   }
 
   public String getName()
   {
   return name;
 
   }
   public int getAge()
   {
   return age;
   }
   public String getCity()
   {
    return city;
   }
}
 
 
class encap
 {
    public static void main(String[] args) {
        student obj=new student();
        obj.setName("Sanju");
        obj.setAge(21);
        obj.setCity("vella kovil");
 
        System.out.println(obj.getName());
        System.out.println(obj.getAge());
        System.out.println(obj.getCity());
    }
 }
 
 
