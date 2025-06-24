import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Static ListView Example',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('listview and  listtile'),
          centerTitle: true
          ,
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('Call someone'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Phone tapped');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('Send an email'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Email tapped');
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
              subtitle: Text('Open the map'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Map tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}
