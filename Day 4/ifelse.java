import java.util.Scanner;

class ifelse{
	public static void main(String arg[]){
	
		Scanner sc =new Scanner(System.in);
		int a=sc.nextInt();
		if(a>0){
			System.out.println("given number is greater than zero");
		}
		else if(a<0){
			System.out.println("given number is lesser than zero");
		}
		else{
			System.out.println("given number is  zero");
		}
	}
}
