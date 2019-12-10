import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cart"),
        centerTitle: false,
      ),
    );
  }
}
