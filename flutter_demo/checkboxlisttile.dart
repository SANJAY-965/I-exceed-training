import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckboxListPage(),
    );
  }
}

class CheckboxListPage extends StatefulWidget {
  @override
  _CheckboxListPageState createState() => _CheckboxListPageState();
}

class _CheckboxListPageState extends State<CheckboxListPage> {
  final List<Item> items = List.generate(
    5,
        (index) => Item(title: 'Item ${index + 1}', isChecked: false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox ListView'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(items[index].title),
            value: items[index].isChecked,
            onChanged: (bool? value) {
              setState(() {
                items[index].isChecked = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}

class Item {
  String title;
  bool isChecked;

  Item({required this.title, required this.isChecked});
}
