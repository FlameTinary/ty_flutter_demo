import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({required super.child, required this.data});

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}