import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Example items (can be any content)
  final int itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView builder',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('ListView.builder Example'),
        ),
        body: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.star),
              title: Text('Item ${index + 1}'),
              subtitle: Text('This is item number ${index + 1}'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on Item ${index + 1}')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
