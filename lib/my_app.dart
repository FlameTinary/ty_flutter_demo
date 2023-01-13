import 'package:flutter/material.dart';
import './navigation/bottom_navigation_bar.dart';

class MyAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      // home: HomePage(),
      home: TYBottomNavBar(),
    );
  }
}
