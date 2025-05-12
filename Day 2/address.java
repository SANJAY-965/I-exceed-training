class address{
	String city;
	int pin;
	address(String city,int pin){
		this.city=city;
		this.pin=pin;
	}
	public  void adisplay(){
		System.out.print(city+" " +pin);
	}
}