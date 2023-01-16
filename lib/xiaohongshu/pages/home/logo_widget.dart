import 'package:flutter/material.dart';

class XHSLogo extends StatelessWidget {
  const XHSLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8,
        bottom: 4,
      ),
      child: Image.asset(
        'images/xiaohongshu/home_logo_normal.png',
      ),
    );
  }
}
