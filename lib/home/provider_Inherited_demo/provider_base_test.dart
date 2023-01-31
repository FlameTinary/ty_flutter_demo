import 'package:flutter/material.dart';

class ProviderBaseTest extends StatelessWidget {
  const ProviderBaseTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider 基础练习"),
      ),
      body: Container(
        child: Text("123"),
      ),
    );
  }
}
