import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: CheckboxExamplePage(),
    );
  }
}

class CheckboxExamplePage extends StatefulWidget {
  @override
  _CheckboxExamplePageState createState() => _CheckboxExamplePageState();
}

class _CheckboxExamplePageState extends State<CheckboxExamplePage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Accept Terms and Conditions'),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          SizedBox(height: 20),
          Text(
            isChecked ? 'You have accepted.' : 'Please accept the terms.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
