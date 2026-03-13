import 'package:flutter/material.dart';

class Morelist extends StatefulWidget {
  Morelist({Key? key}) : super(key: key);

  @override
  _MorelistState createState() => _MorelistState();
}

class _MorelistState extends State<Morelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10), itemBuilder: (BuildContext context, int index){
        return Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Container(
            child: Text("商品", style: TextStyle(color: Colors.white),),
            color: Colors.blue,
            alignment: Alignment.center,
          ),
        );
      });
  }
}