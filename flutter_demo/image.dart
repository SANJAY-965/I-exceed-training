import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.photos.request();
  runApp(MyImage());
}
class MyImage extends StatelessWidget {
  const MyImage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            child: Image.file(File('/sdcard/Download/SanjayB.jpg'))
        ),
      ),
    );
  }
}
 