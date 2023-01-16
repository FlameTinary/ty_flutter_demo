import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/account/mine_page.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/home_page.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/messages/message_page.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/videos/videos_page.dart';

class XHSBottomNavBar extends StatefulWidget {
  const XHSBottomNavBar({super.key});

  @override
  State<XHSBottomNavBar> createState() => _XHSBottomNavBarState();
}

class _XHSBottomNavBarState extends State<XHSBottomNavBar> {
  int _currentIndex = 0;
  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages
      ..add(XHSHomePage())
      ..add(XHSVideosPage())
      ..add(XHSMessagePage())
      ..add(XHSMinePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: '视频'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '我'),
        ],
        onTap: ((value) {
          setState(() {
            _currentIndex = value;
          });
        }),
      ),
    );
  }
}
