import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Text Widget Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Simple Text',
              ),
              SizedBox(height: 16),
              Text(
                'Bold and Colored Text',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Text with max lines and overflow ellipsis. '
                    'This sentence is intentionally made long so it overflows on purpose.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16),
              Text(
                'Centered Text',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: 'Hello ',
                  style: TextStyle(fontSize: 18),
                  children: [
                    TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'colored',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: ' text!',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
