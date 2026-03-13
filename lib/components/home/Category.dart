import 'package:flutter/material.dart';
import 'package:shop_app/viewmodels/home.dart';

class Category extends StatefulWidget {
  // 分类列表
  final List<CategoryItem> categoryList;
  Category({Key? key, required this.categoryList}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.categoryList[index].picture,
                  width: 50,
                  height: 50,
                ),
                Text(
                  widget.categoryList[index].name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
