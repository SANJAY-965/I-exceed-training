import java.util.LinkedList;

public class inkedlist {
    public static void main(String[] args) {
        // Create a LinkedList of Strings
        LinkedList<String> fruits = new LinkedList<>();

        // Adding elements
        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Mango");
        fruits.addFirst("Strawberry"); // Add at the beginning
        fruits.addLast("Orange");      // Add at the end

        // Display the list
        System.out.println("Fruits list: " + fruits);

        // Accessing elements
        System.out.println("First fruit: " + fruits.getFirst());
        System.out.println("Last fruit: " + fruits.getLast());

        // Removing elements
        fruits.remove("Banana");
        fruits.removeFirst(); // Removes "Strawberry"
        fruits.removeLast();  // Removes "Orange"

        // Final list
        System.out.println("Updated fruits list: " + fruits);
    }
}
