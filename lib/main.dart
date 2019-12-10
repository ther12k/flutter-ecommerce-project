import 'package:flutter/material.dart';
import 'userScreens/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      hide flutter debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kopen',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new homePage(),
    );
  }
}