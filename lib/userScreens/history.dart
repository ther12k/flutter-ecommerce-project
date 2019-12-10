import 'package:flutter/material.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("History"),
        centerTitle: false,
      ),
    );
  }
}
