import java.util.*;

public class collection {
    public static void main(String[] args) {
        // Creating a Collection (using ArrayList)
        Collection<String> fruits = new ArrayList<>();

        // 1. add(E e) - Adds an element
        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Cherry");

        // 2. addAll(Collection<? extends E> c) - Adds all elements from another collection
        Collection<String> moreFruits = Arrays.asList("Dates", "Elderberry");
        fruits.addAll(moreFruits);

        // 3. contains(Object o) - Checks if element is present
        System.out.println("Contains Banana? " + fruits.contains("Banana"));  // true

        // 4. containsAll(Collection<?> c) - Checks if all elements are present
        System.out.println("Contains all moreFruits? " + fruits.containsAll(moreFruits));  // true

        // 5. remove(Object o) - Removes a single element
        fruits.remove("Apple");
        System.out.println("After removing Apple: " + fruits);

        // 6. removeAll(Collection<?> c) - Removes all specified elements
        fruits.removeAll(Arrays.asList("Dates", "Elderberry"));
        System.out.println("After removeAll: " + fruits);

        // 7. retainAll(Collection<?> c) - Keeps only specified elements
        fruits.retainAll(Arrays.asList("Banana", "Fig"));  // "Cherry" will be removed
        System.out.println("After retainAll: " + fruits);

        // 8. isEmpty() - Checks if the collection is empty
        System.out.println("Is empty? " + fruits.isEmpty());  // false

        // 9. size() - Number of elements
        System.out.println("Size: " + fruits.size());

        // 10. iterator() - Get an Iterator  to loop over element
        Iterator it = fruits.iterator();
        System.out.print("Iterating: ");
        while (it.hasNext()) {
            System.out.print(it.next() + " ");
        }
        System.out.println();

        // 11. clear() - Removes all elements
        fruits.clear();
        System.out.println("After clear(): " + fruits);
        System.out.println("Is empty after clear? " + fruits.isEmpty());
    }
}

