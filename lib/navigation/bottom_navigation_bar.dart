import 'dart:math';

import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../favorite/favorite_page.dart';
import '../message/message_page.dart';
import '../mine/mine_page.dart';
import '../photos/photo_page.dart';

class TYBottomNavBar extends StatefulWidget {
  const TYBottomNavBar({Key? key}) : super(key: key);

  @override
  State<TYBottomNavBar> createState() => _TYBottomNavBarState();
}

class _TYBottomNavBarState extends State<TYBottomNavBar> {
  // 点击bottom nav bar 的 item 切换页面
  // void _chagneItem() {
  //   print('hello');
  // }

  // floatingActionButton点击
  void _floatBtnClick() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: PhotoPage(),
          );
        },
      ),
    );
  }

  // page 数组
  List<Widget> _pages = [];

  // 当前 page 的 index
  int _currentIndex = 0;

  @override
  void initState() {
    // 初始化数据
    _pages
      ..add(HomePage())
      ..add(FavoritePage())
      ..add(MessagePage())
      ..add(MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _floatBtnClick,
      ),
      // 控制floatingActionButton的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        // 圆形挖孔
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: Icon(Icons.favorite),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              icon: Icon(Icons.message),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
