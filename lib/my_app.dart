import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/navigations/bottom_navbar.dart';
// import './navigation/bottom_navigation_bar.dart';

class MyAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        splashColor: Colors.transparent, // 点击时的水波纹颜色设置为透明
        highlightColor: Colors.transparent, // 点击时的背景高亮颜色设置为透明
        primarySwatch: Colors.red,
      ),
      // home: HomePage(),
      // home: TYBottomNavBar(),
      home: XHSBottomNavBar(),
    );
  }
}
