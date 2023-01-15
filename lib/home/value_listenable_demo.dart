import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableDemo extends StatefulWidget {
  const ValueListenableDemo({super.key});

  @override
  State<ValueListenableDemo> createState() => _ValueListenableDemoState();
}

class _ValueListenableDemoState extends State<ValueListenableDemo> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('valueListenableBuilder')),
      body: Center(
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
