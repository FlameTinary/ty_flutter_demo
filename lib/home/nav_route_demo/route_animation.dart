import 'package:flutter/material.dart';
import 'custom_pageroute_animation.dart';
import 'hero_from_page.dart';

class RouteAnimationDemoList extends StatelessWidget {
  const RouteAnimationDemoList({Key? key}) : super(key: key);

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
              // 自定义路由
              FadeRoute(
                builder: (context) {
                  return NewPage();
                },
              ),
              // 使用PageRouteBuilder
              // PageRouteBuilder(
              //   transitionDuration: Duration(milliseconds: 500),
              //   pageBuilder: (context, animation, secondaryAnimation) {
              //     return FadeTransition(
              //       opacity: animation,
              //       child: NewPage(),
              //     );
              //   },
              // ),
            ),
          ),
          ListTile(
            title: Text('缩放'),
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                ) {
                  return ScaleTransition(
                    scale: animation,
                    child: NewPage(),
                  );
                },
              ),
            ),
          ),
          ListTile(
            title: Text('翻转'),
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return RotationTransition(
                    turns: animation,
                    child: NewPage(),
                  );
                },
              ),
            ),
          ),
          ListTile(
            title: Text('hero动画'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HeroFromPage();
                },
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
  const NewPage({Key? key}) : super(key: key);

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
