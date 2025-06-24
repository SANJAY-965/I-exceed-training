import 'package:flutter/material.dart';
import 'main.dart';

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Third Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),

      body:Center(
        child: ElevatedButton(
          onPressed:(){
            Navigator.pushNamed(
                context,'/'
            );
          },
          child: Text("--------->",style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
