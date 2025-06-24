import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SizedBox Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('SizedBox Example'),backgroundColor: Colors.red,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('First Line'),

            // Add vertical space
            SizedBox(height: 50),

            Text('Second Line'),
          ],
        ),
      ),
    );
  }
}
