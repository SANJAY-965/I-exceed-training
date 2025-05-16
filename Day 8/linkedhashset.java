import java.util.LinkedHashSet;

public class linkedhashset {
    public static void main(String[] args) {
        LinkedHashSet<String> set = new LinkedHashSet<>();

        set.add("Banana");
        set.add("Apple");
        set.add("Mango");
        set.add("Apple"); // Duplicate

        System.out.println("LinkedHashSet: " + set);
    }
}

