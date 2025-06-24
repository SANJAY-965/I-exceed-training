import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divider Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Horizontal Divider'),backgroundColor: Colors.red,),
        body: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('John Doe'),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('johndoe@example.com'),
            ),
          ],
        ),
      ),
    );
  }
}
