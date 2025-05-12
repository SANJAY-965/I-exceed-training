import java.util.Scanner;

class switchcase{
	public static void main(String arg[]){
	
		Scanner sc =new Scanner(System.in);
		int a=sc.nextInt();
		switch(a){
			case 0:
			System.out.println("zero");
			break;
			case 1:
			System.out.println("one");
			break;
			case 2:
			System.out.println("two");
			break;
			case 3:
			System.out.println("three");
			break;
			case 4:
			System.out.println("four");
			break;
			default:
			System.out.println("greater than 4");
			}
	}
}
