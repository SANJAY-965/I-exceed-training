import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Padding Example'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: EdgeInsets.all(50), // 20 pixels on all sides
          child: Container(
            color: Colors.amber,
            child: Text(
              'This container has padding on all sides.',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
