import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Expanded Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('With Expanded')),
        body: Row(
          children: [
            Icon(Icons.info, size: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'This is a very very long text that now wraps or truncates properly using Expanded.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
