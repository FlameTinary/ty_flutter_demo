import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/navigations/bottom_navbar.dart';
// import './navigation/bottom_navigation_bar.dart';

class MyAppDemo extends StatefulWidget {
  @override
  State<MyAppDemo> createState() => _MyAppDemoState();
}

class _MyAppDemoState extends State<MyAppDemo> with WidgetsBindingObserver {
  // 控制隐私保护页面是否显示
  bool _isHidden = false;
  @override
  void initState() {
    super.initState();
    // 将当前实例的监听添加到WidgetsBinding的实例对象中
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    // 从 WidgetsBinding 的实例对象中移除对当前对象的监听
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _isHidden = state != AppLifecycleState.resumed;
    });
  }

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
      home: Stack(
        children: [
          XHSBottomNavBar(),
          if (_isHidden)
            Container(
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}
