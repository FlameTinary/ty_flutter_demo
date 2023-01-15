import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableDemo extends StatefulWidget {
  const ValueListenableDemo({super.key});

  @override
  State<ValueListenableDemo> createState() => _ValueListenableDemoState();
}

class _ValueListenableDemoState extends State<ValueListenableDemo> {
  // 使用ValueNotifier封装数据
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('valueListenableBuilder')),
      body: Center(
        // 使用ValueListenableBuilder监听数据变化, 
        // 数据变化后会调用ValueListenableBuilder的 builder
        child: ValueListenableBuilder<int>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [child!, Text('count = $value')],
            );
          },
          valueListenable: _counter,
          child: Text('点击了...'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter.value++;
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
