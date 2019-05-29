import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'my_app.dart';

/**
 * Flutter 应用中main函数为应用程序的入口 
 * main函数中调用了，runApp 方法,它的功能是启动Flutter应用,它接受一个Widget参数(MyApp)
 * MyApp参数代表Flutter应用
 * main函数使用了(=>)符号，这是Dart中单行函数或方法的简写
*/

void main() {
  debugPaintSizeEnabled=false;
  runApp(MyAppDemo());
}




