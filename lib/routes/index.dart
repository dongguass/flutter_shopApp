import 'package:flutter/material.dart';
import 'package:shop_app/pages/index.dart';
import 'package:shop_app/pages/login.dart';

Widget getRootWidget() {
  return MaterialApp(
    // 命名路由
    initialRoute: "/", // 初始页面
    routes: getRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    "/" : (content) => mainPage(),
    "/login" : (content) => loginPage()
  };
}