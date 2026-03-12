import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart.dart';
import 'package:shop_app/pages/categories.dart';
import 'package:shop_app/pages/home.dart';
import 'package:shop_app/pages/mine.dart';

class mainPage extends StatefulWidget {
  mainPage({Key? key}) : super(key: key);

  @override
  _mainPage createState() => _mainPage();
}

class _mainPage extends State<mainPage> {
  // 定义数据，根据数据渲染四个导航
  final List<Map<String, String>> _tabList = [
    {
      'icon' : 'lib/assets/ic_public_home_normal.png',
      'activ_icon': 'lib/assets/ic_public_home_active.png',
      'text' : '首页'
    },
    {
      'icon' : 'lib/assets/ic_public_pro_normal.png',
      'activ_icon': 'lib/assets/ic_public_pro_active.png',
      'text' : '分类'
    },
    {
      'icon' : 'lib/assets/ic_public_cart_normal.png',
      'activ_icon': 'lib/assets/ic_public_cart_active.png',
      'text' : '购物车'
    },
    {
      'icon' : 'lib/assets/ic_public_my_normal.png',
      'activ_icon': 'lib/assets/ic_public_my_active.png',
      'text' : '我的'
    }
  ];
  // 定义tabbar变量
  int _currentIndex = 0;

  List<BottomNavigationBarItem> getTabbarWidget(){
    return List.generate(_tabList.length, (index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!, width: 30, height: 30,),
        activeIcon: Image.asset(_tabList[index]['activ_icon']!, width: 30, height: 30,),
        label: _tabList[index]['text']
      );
    });
  }

  // 页面中部显示，页面组件
  List<Widget> _getBodyWidgets(){
    return [homeView(),categoryView(),cartView(),mineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getBodyWidgets(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getTabbarWidget(),
        onTap: (index){
          _currentIndex = index;
          setState(() {
            
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}