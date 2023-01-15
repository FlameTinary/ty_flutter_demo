import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({super.key});

  @override
  State<StreamBuilderDemo> createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  Stream<int> counter() {
    return Stream.periodic(Duration(milliseconds: 2000), (computationCount) {
      return computationCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder demo'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: counter(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return Text("active: ${snapshot.data}");
              case ConnectionState.done:
                return Text("已关闭");
              case ConnectionState.none:
                return Text("没有 stream");
              case ConnectionState.waiting:
                return Text("等待数据");
            }
            // return Text('');
          },
        ),
      ),
    );
  }
}
