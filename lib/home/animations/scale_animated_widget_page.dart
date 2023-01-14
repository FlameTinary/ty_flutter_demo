import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  const ScaleAnimationPage({Key key}) : super(key: key);

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // 初始化 controller
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    // 指定一个 curve, 弹簧效果
    Animation bounceCurveAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 图片宽高从 0~300
    animation = Tween(begin: 0.0, end: 300.0).animate(bounceCurveAnimation)
      ..addListener(() {
        setState(() {});
      });
    // 启动动画
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('scale animation page')),
      body: Center(
        child: Image.asset(
          'images/lake.jpg',
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 卸载 controller
    controller.dispose();
    super.dispose();
  }
}
