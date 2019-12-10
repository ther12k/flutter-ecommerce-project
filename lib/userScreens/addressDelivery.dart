import 'package:flutter/material.dart';

class addressDelivery extends StatefulWidget {
  @override
  _addressDeliveryState createState() => _addressDeliveryState();
}

class _addressDeliveryState extends State<addressDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Address Delivery"),
        centerTitle: false,
      ),
    );
  }
}
