import 'package:flutter/material.dart';
import 'package:test_project1/home/home.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Blog",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white
      ),
      home: Home(),
    );
  }
}
