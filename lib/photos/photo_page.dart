import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  // 返回上级页面
  void _back(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('photo page'),
            TextButton(onPressed: () => _back(context), child: Text('back')),
          ],
        ),
      ),
    );
  }
}
