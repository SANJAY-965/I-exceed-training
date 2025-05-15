import java.util.*;

class stringbufffer{
	public static void main(String arg[]){
	//Scanner sc = new Scanner(System.in);
	String a="Welcome";
	
	StringBuffer s = new StringBuffer(a);
	s.append("To Bengaluru");
	System.out.println("capacity "+s.capacity());
	
	System.out.println(s);
	
	s.insert(5, ",");         
	System.out.println(s);
	
        s.replace(6, 9, "--"); 
        System.out.println(s);    
          
        s.delete(5, 9);    
        System.out.println(s);   
               
        s.reverse();   
        System.out.println(s);  
                    
	char ch = s.charAt(0);
	System.out.println(ch);  
	
	s.setCharAt(0, 'D');
        System.out.println(s);
        
        int length = s.length();
        System.out.println("Length: " + length);
        
        System.out.println("capacity "+s.capacity());
        
        s.ensureCapacity(100);
        System.out.println("Capacity" + s.capacity());
        
        String sub = s.substring(0, 5);
        System.out.println( sub);

    
        String result = s.toString();
        System.out.println("Final string: " + result);
        
        String sub1 = result.substring(0, 5);
        System.out.println( sub1);
        
	}
	
}
