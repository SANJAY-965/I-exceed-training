import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class outBuffer {
    public static void main(String[] args) throws IOException {
        FileOutputStream fos  = new FileOutputStream("sam.txt");
        String str = "this example is for fileoutputstream.";
        byte w[] = str.getBytes();
        fos.write(w);
        fos.close();
        
        FileInputStream fis = new FileInputStream("sam.txt");
        BufferedInputStream bis = new BufferedInputStream(fis);
        int i=0;
        while((i=bis.read())!=-1){
            System.out.println(i+" "+(char)i);
        }
        System.out.println((char)fis.read());

    }
}

