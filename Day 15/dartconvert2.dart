import 'dart:convert';

void main() {
  String text = "az";

  // Encode to UTF-8 bytes
  List<int> bytes = utf8.encode(text);
  print('UTF-8 bytes: $bytes');

  // Decode from UTF-8 bytes
  String decoded = utf8.decode(bytes);
  print('Decoded string: $decoded');
}


/*

JSON Encode	jsonEncode(obj)
JSON Decode	jsonDecode(string)
UTF-8 Encode	utf8.encode(string)
UTF-8 Decode	utf8.decode(bytes)
Base64 Encode	base64.encode(bytes)
Base64 Decode	base64.decode(string)

*/
