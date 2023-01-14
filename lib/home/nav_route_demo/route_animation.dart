import 'package:flutter/material.dart';
import 'custom_pageroute_animation.dart';

class RouteAnimationDemoList extends StatelessWidget {
  const RouteAnimationDemoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('转场动画'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('正常跳转'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => NewPage()),
              ),
            ),
          ),
          ListTile(
            title: Text('渐隐渐现'),
            onTap: () => Navigator.push(
              context,
              FadeRoute(
                builder: (context) {
                  return NewPage();
                },
              ),
              // PageRouteBuilder(
              //   transitionDuration: Duration(milliseconds: 500),
              //   pageBuilder: (context, animation, secondaryAnimation) {
              //     return FadeTransition(
              //       opacity: animation,
              //       child: NewPage(),
              //     );
              //   },
              // ),

              // MaterialPageRoute(
              //   builder: ((context) => NewPage()),
              // ),
            ),
          ),
          ListTile(
            title: Text('翻转'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => NewPage()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 转场后的页面
class NewPage extends StatelessWidget {
  const NewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('new page')),
      body: Container(
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('new page'),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}
