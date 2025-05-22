void main() {
  // 1. Calling a basic function
  sayHello();

  // 2. Calling a function with parameters and return value
  int result = add(10, 20);
  print('Sum is: $result');

  // 3. Calling a function with optional parameters
  greet('Alice',25);
  greet(); // Uses defalt value

  // 4. Calling a function with named parameters
  describePerson(name: 'John', age: 30);
  describePerson(age: 25); // Only age, name uses default

  // 5. Using an arrow (short) function
  int product = multiply(4, 5);
  print('Product is: $product');

  // 6. Using an anonymous function (lambda)
  List<int> numbers = [1, 2, 3];
  numbers.forEach((number) {
    print('Double of $number is ${number * 2}');
  });
}

// 1. Basic function without parameters or return value
void sayHello() {
  print('Hello from Dart!');
}

// 2. Function with parameters and a return value
int add(int a, int b) {
  return a + b;
}

// 3. Function with an optional parameter and default value
void greet([String name = 'Guest',int age =0]) {
  print('Hello, $name $age');
}

// 4. Function with named parameters and default values

void describePerson({String name="", int age=0}) {
  print('Name: $name, Age: $age');
}

// 5. Arrow function (shorthand syntax)
int multiply(int a, int b) => a * b;

