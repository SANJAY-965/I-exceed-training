import 'dart:convert';

void main() {
  // Example Dart map
  Map<String, dynamic> user = {
    'name': 'Alice',
    'age': 30,
    'email': 'alice@example.com',
  };

  // Convert Map to JSON string
  String jsonString = jsonEncode(user);
  print('JSON: $jsonString');

  // Convert JSON string back to Map
  Map<String, dynamic> decoded = jsonDecode(jsonString);
  print('Name: ${decoded['name']}');
  print(decoded);
}

