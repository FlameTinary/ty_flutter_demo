import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/xiaohongshu/common/notifications/drawer_notification.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/account/mine_page.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/home_page.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/messages/message_page.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/videos/videos_page.dart';

import '../account/left_drawer.dart';

class XHSBottomNavBar extends StatefulWidget {
  const XHSBottomNavBar({super.key});

  @override
  State<XHSBottomNavBar> createState() => _XHSBottomNavBarState();
}

class _XHSBottomNavBarState extends State<XHSBottomNavBar> {
  final _stateKey = GlobalKey<ScaffoldState>();

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
    // 这个NotificationListener用来监听个人页面左上角按钮点击打开 drawer
    return NotificationListener<XHSDrawerNotification>(
      onNotification: (notification) {
        _stateKey.currentState?.openDrawer();
        return true;
      },
      child: Scaffold(
        key: _stateKey,
        drawer: MyLeftDrawer(),
        drawerEnableOpenDragGesture: false,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.video_call), label: '视频'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: '我'),
          ],
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
        ),
      ),
    );
  }
}
