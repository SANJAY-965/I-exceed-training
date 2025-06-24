import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CircleAvatar Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('CircleAvatar Example'),backgroundColor: Colors.red,),
        body: Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue[200],
            child: Text(
              'AB',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
