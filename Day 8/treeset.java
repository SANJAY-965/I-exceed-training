import java.util.TreeSet;

public class treeset {
    public static void main(String[] args) {
        TreeSet<String> set = new TreeSet<>();

        set.add("Banana");
        set.add("Apple");
        set.add("Mango");
        set.add("Apple"); // Duplicate

        System.out.println("TreeSet: " + set);
    }
}

