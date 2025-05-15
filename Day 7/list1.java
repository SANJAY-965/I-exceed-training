import java.util.*;

public class list1 {
    public static void main(String[] args) {
        List<String> fruits = new ArrayList<>();
        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Mango");
        
        Collections.sort(fruits);
        fruits.set(0,"pineapple");
         System.out.println(fruits.get(0));
        
            System.out.println(fruits);
        Iterator i=fruits.iterator();
        while(i.hasNext()){
         System.out.println(i.next());
        }
    }
}

