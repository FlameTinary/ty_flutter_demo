import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with TickerProviderStateMixin {

  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {

    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(child: Container(
        child: FadeTransition(
          opacity: curve,
          child: FlutterLogo(
            size: 100.0,
          ),
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: (){
          controller.forward();
        },
      ),
    );
    
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}