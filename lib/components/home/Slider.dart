import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/viewmodels/home.dart';

class slider extends StatefulWidget {
  final List<BannerImg> bannerList;
  slider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _sliderState createState() => _sliderState();
}
class _sliderState extends State<slider> {
  // flutter中获取屏幕宽度的方法
  // final double screenWidth = MediaQuery.of(BuildContext context).size.width;
  // 返回轮播图插件组件，根据数据渲染不同轮播图选项
  Widget _getSlider() {
    return CarouselSlider(items: List.generate(widget.bannerList.length, (int index){
      return Image.network(widget.bannerList[index].imgUrl, fit: BoxFit.cover,width: 800,);
    }), options: CarouselOptions(viewportFraction: 1, autoPlay: true));
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider()
      ],
    );
  }
}