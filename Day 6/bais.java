import java.io.ByteArrayInputStream;

class bais{
	public static void main(String arg[]){
		byte a[]={65,66,67,68,69,70};
		ByteArrayInputStream b=new ByteArrayInputStream(a);
		int i=0;
		System.out.println(b.available());
		b.skip(3);
		while((i=b.read())!=-1){
			System.out.print(i+" ");
		}
	}
}
