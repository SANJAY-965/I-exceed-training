import 'package:flutter/material.dart';
import 'loan/loan_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking Loans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white,),
      home: LoanPage(),
    );
  }
}

