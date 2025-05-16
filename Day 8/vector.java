import java.util.Vector;

public class vector {
    public static void main(String[] args) {
        Vector<String> names = new Vector<>();

        names.add("Alice");
        names.add("Bob");
        names.add("Charlie");

        System.out.println("Vector: " + names);

        names.remove("Bob");

        System.out.println("After removal: " + names);
    }
}

