class person{
	String? name;
	int? age;
	person({this.name,this.age});
	
	void display(){
		print("$name with $age");
	}
}



void main(){

	person s=person(age:21,name:"Sanjay B");
	s.display();
	
	
	}


