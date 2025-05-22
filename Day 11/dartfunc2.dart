//function is passed as an argument  to another function

void main() {
  //display(lower,"I-EXCEED");
  //display(upper,"welcome you");
  var res = display;
  res(lower, "I-EXCEED");
  res(upper,"welcome you");
}

void lower(String str) {
  print(str.toLowerCase());
}

void upper(String str) {
  print(str.toUpperCase());
}

void display(Function call, String str) {
  call(str);
}

