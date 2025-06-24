import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: DropdownExamplePage(),
    );
  }
}

class DropdownExamplePage extends StatefulWidget {
  @override
  _DropdownExamplePageState createState() => _DropdownExamplePageState();
}

class _DropdownExamplePageState extends State<DropdownExamplePage> {
  String selectedValue = 'rasika';
  final List<String> items = ['rasika', 'jp', 'dharsh', 'nithya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedValue,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Selected: $selectedValue',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
