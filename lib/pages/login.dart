import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("主页"),),
      body: Center(
        child: Text("body"),
      ),
    );
  }
}