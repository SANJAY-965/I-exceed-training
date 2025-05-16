import java.util.Stack;

public class tack {
    public static void main(String[] args) {
        Stack<Integer> stack = new Stack<>();

        stack.push(10);
        stack.push(20);
        stack.push(30);

        System.out.println("Stack: " + stack);

        int top = stack.pop(); // Removes 30
        System.out.println("Popped: " + top);
        System.out.println("Stack after pop: " + stack);
    }
}

