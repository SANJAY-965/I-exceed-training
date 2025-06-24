import 'package:flutter/material.dart';
class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Second Page"),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            RichText(text:
            TextSpan(
                text: "Bank\n",
                style: TextStyle(
                  fontFamily: 'serif',
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
                children: [
                  TextSpan
                    (
                    text: "I-Excced",
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'times',
                        color:Colors.redAccent
                    ),

                  ),
                ]
            ),

            ),
            Center(
              child: ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(
                      context,'/third'
                  );
                },
                child: Text("--------->",style: TextStyle(color: Colors.black),),
              ),
            ),

          ],
        )
      );

  }
}

