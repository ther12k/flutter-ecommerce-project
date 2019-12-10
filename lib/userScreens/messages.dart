import 'package:flutter/material.dart';

class messages extends StatefulWidget {
  @override
  _messagesState createState() => _messagesState();
}

class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Messages"),
        centerTitle: false,
      ),
    );
  }
}
