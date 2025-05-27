import 'dart:convert';

void main() {
  String data = 'Dart is fun!';

  // Encode to Base64
  String encoded = base64.encode(utf8.encode(data));
  print('Base64 Encoded: $encoded');

  // Decode from Base64
  String decoded = utf8.decode(base64.decode(encoded));
  print('Base64 Decoded: $decoded');
}

