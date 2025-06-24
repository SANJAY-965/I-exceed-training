import 'package:flutter/material.dart';
import 'main.dart';
import 'main2.dart';
import 'main4.dart';
void main(){
  runApp(MyApp5());
}

class MyApp5 extends StatelessWidget {
  const MyApp5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>MyApp(),
        '/second':(context)=>MyApp2(),
        '/third':(context)=>MyApp4(),
      },
    );
  }
}
