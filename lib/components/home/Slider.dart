import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/viewmodels/home.dart';

class slider extends StatefulWidget {
  final List<BannerImg> bannerList;
  slider({Key? key, required this.bannerList}) : super(key: key);
  int _currentIndex = 0;
  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  CarouselSliderController _sliderController = CarouselSliderController();
  // flutter中获取屏幕宽度的方法
  // final double screenWidth = MediaQuery.of(BuildContext context).size.width;
  // 返回轮播图插件组件，根据数据渲染不同轮播图选项
  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _sliderController,
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: 800,
        );
      }),
      options: CarouselOptions(viewportFraction: 1, autoPlay: true,
        onPageChanged: (index, reason) {
          widget._currentIndex = index;
          setState(() {
            
          });
        },
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 轮播图
        _getSlider(),
        // 搜索框
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "搜索...",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
        // 底部导航按钮
        Positioned(
          right: 0,
          left: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: List.generate(widget.bannerList.length, (int index) {
              return GestureDetector(
                onTap: () {
                  _sliderController.animateToPage(index,duration: Duration(seconds: 1));
                  // widget._currentIndex = index;
                  setState(() {
                    
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 6,
                  width: index == widget._currentIndex ? 20 :40,
                  decoration: BoxDecoration(
                    color:index == widget._currentIndex? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
