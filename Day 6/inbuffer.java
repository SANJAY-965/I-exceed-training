import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class inbuffer  {
    public static void main(String[] args) throws IOException {
        FileOutputStream fos  = new FileOutputStream("inbuff.txt");
        String str = "This example is for file.";
        byte w[] = str.getBytes();
        fos.write(w);
        fos.close();
        
        FileInputStream fis = new FileInputStream("inbuff.txt");
        BufferedInputStream bis = new BufferedInputStream(fis);
        int i=0;
        while((i=bis.read())!=-1){
            //System.out.print(i+" "+(char)i);
        System.out.print((char)i);
        }

    }
}

