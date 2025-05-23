import oops6.dart;

extension on String{
 	String display2(String a,String b,String c){
 		return a.trim().replaceAll(b,c);
 	}
}

void main(){
	Student stu =new Student("student",21);
	stu.display();
	var res=stu.display1("Bengaluru");
	print(res);
	String str="";
	var res1=str.display2("            I am a hero             ","am","will be");
	print(res1);
}
