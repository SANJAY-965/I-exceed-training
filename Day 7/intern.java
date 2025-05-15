class intern{
	public static void main(String arg[]){
		String a="Sanjay";
		String b="Sanjay";
		String c=new String("Sanjay");
		
		System.out.println(a.equals(b));
		System.out.println(a.equals(c));
		System.out.println(a==c);
		System.out.println(a==b);
		
		String d=new String("Sanjay").intern();
		System.out.println(a==d);
	}
}
