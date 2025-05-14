import java.io.FileOutputStream;
import java.io.FileInputStream;
// FileOutputStream -- Writes raw bytes to a file 
// FileInputStream -- Reads raw bytes to a file
class filerw {
	public static void main(String[] args) throws Exception {
		FileOutputStream fos = new FileOutputStream("myfile.txt");
		String text = "I am Sanjay Balu";
		fos.write(text.getBytes());
		//System.out.println("File named myfile.txt created successfully\n");
		FileInputStream fis = new FileInputStream("myfile.txt");
		int n;
		while( (n=fis.read()) != -1) {
			System.out.print((char)n);
		}
		System.out.println();
		
	}
}
