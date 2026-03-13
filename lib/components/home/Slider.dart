import 'package:flutter/material.dart';

class slider extends StatefulWidget {
  slider({Key? key}) : super(key: key);

  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
       alignment: Alignment.center,
       color: Colors.blue,
       child: Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}