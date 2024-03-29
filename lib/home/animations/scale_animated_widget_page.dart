import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key, required this.animation, this.child})
      : super(key: key);

  final Animation<double> animation;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return SizedBox(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
    );
  }
}

class ScaleAnimationPage1 extends StatefulWidget {
  const ScaleAnimationPage1({Key? key}) : super(key: key);

  @override
  State<ScaleAnimationPage1> createState() => _ScaleAnimationPage1State();
}

class _ScaleAnimationPage1State extends State<ScaleAnimationPage1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 初始化 controller
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    // 指定一个 curve, 弹簧效果
    Animation<double> bounceCurveAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // 图片宽高从 0~300
    animation = Tween(begin: 0.0, end: 300.0).animate(bounceCurveAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 动画执行结束,开始反向执行动画
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 动画执行到初始位置,开始从初始位置继续播放动画
          controller.forward();
        }
      });
    // 启动动画, 正向
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('scale animation page')),
      body: Center(
        child: GrowTransition(
          animation: animation,
          child: Image.asset('assets/lake.jpg'),
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
