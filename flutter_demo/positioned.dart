import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Positioned Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Positioned Example'),
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.amber[200],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: Center(child: Text('TL')), // Top Left
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: Center(child: Text('BR')), // Bottom Right
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
