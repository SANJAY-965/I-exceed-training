import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final int itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView separated ',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('ListView.separated Example'),
        ),
        body: ListView.separated(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.label),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Details for item ${index + 1}'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped Item ${index + 1}')),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ),
    );
  }
}
