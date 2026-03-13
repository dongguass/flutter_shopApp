import 'package:flutter/material.dart';
import 'package:shop_app/components/home/Category.dart';
import 'package:shop_app/components/home/Hot.dart';
import 'package:shop_app/components/home/MoreList.dart';
import 'package:shop_app/components/home/Slider.dart';
import 'package:shop_app/components/home/Suggetion.dart';
import 'package:shop_app/viewmodels/home.dart';

class homeView extends StatefulWidget {
  homeView({Key? key}) : super(key: key);

  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  final List<BannerImg> _bannerList = [
    BannerImg(id: "1", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"),
    BannerImg(id: "2", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"),
    BannerImg(id: "3", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg")
  ];
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg


  // 主页框架内容
  List<Widget> _getScrollChildren(){
    return [
      // 包裹普通widget的sliver家族组件
      SliverToBoxAdapter(
        child: slider(bannerList: _bannerList,),
      ),
      // 间隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      // 分类组件
      SliverToBoxAdapter(child: Category(),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      // 推荐组件
      SliverToBoxAdapter(child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),child: Suggestion())),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      // 爆款推荐 flex与expanded组合 平分空间
      SliverToBoxAdapter(child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Flex(direction: Axis.horizontal,
        children: [
          Expanded(child: Hot()),SizedBox(width: 10,),Expanded(child: Hot())
        ],
      ),
      ),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      Morelist()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(), // 
    );
  }
}