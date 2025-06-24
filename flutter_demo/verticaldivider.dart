import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vertical Divider Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Vertical Divider'),backgroundColor: Colors.red,),
        body: Row(
          children: [
            Expanded(
              child: Center(child: Text('Left Side')),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 20, // space between the sections
            ),
            Expanded(
              child: Center(child: Text('Right Side')),
            ),
          ],
        ),
      ),
    );
  }
}
