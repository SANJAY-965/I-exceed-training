void main(){

	var res= add(10,20);
	
	print(res);
	
	sub(10,20);

	dis(add,sub,1,2);
	
	(int a,int b){
	print(a~/b); 
	}(100,10);

}
//closer function
var add=(int a,int b){
	return a+b; 
};


//arrow function
sub(int a,int b) => print(b-a); 


//function as a parameter
//dis is higher order function
void dis(Function f,Function f1,int a,int b){
	print(f(a,b));
	f1(a,b);
}

