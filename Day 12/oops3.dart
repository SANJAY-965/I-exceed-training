class Student {
  String? _name;
  int? _age;

  set setname(String name) {
    this._name = name;
  }

  set setage(int age) {
    this._age = age;
  }

  String? getname() => _name;
  int? get getage => _age;
}

void main() {
  Student stu = Student();
  stu.setname = "Sanjay B";
  stu.setage = 21;

  print(stu.getname()); // ✅ call as method
  print(stu.getage);    // ✅ getter property
}

