import 'package:flutter/material.dart';
import 'main2.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHome();

  }
}
class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Navigation"),
          centerTitle: true,
          foregroundColor: Colors.white,

        ),

        body:
        Center(
          child: ElevatedButton(
            onPressed:(){
              Navigator.pushNamed(
                  context,'/second'
              );
            },
            child: Text("--------->",style: TextStyle(color: Colors.black),),
          ),
        ),
      );
  }
}