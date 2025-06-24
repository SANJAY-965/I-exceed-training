import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RichText Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RichText Demo'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Flutter ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: 'is ',
                ),
                TextSpan(
                  text: 'awesome!',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
