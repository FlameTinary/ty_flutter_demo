import 'package:flutter/material.dart';

class XHSMessagePage extends StatelessWidget {
  const XHSMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息')),
      body: Center(
        child: Text('message'),
      ),
    );
  }
}
