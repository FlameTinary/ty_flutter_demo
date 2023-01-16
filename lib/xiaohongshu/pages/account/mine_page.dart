import 'package:flutter/material.dart';

class XHSMinePage extends StatelessWidget {
  const XHSMinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: Center(child: Text('mine'),),
    );
  }
}