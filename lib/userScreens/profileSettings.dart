import 'package:flutter/material.dart';

class profileSettings extends StatefulWidget {
  @override
  _profileSettingsState createState() => _profileSettingsState();
}

class _profileSettingsState extends State<profileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile Settings"),
        centerTitle: false,
      ),
    );
  }
}
