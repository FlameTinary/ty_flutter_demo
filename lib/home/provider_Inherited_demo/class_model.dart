import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/student_model.dart';

/// 这个类是发布者类, 当数据发生改变的时候通知订阅者
class ClassModel extends ChangeNotifier {
  // 用于保存学生数据
  final List<Student> _list = [];
  // 禁止外部直接修改 list 的值
  UnmodifiableListView<Student> get list =>
      UnmodifiableListView<Student>(_list);

  // 获取班级学生总人数
  int get totalCount => _list.length;

  // 为班级添加学生
  void add(Student student) {
    _list.add(student);

    // 通知(订阅者), 重新构建 InheritedProvider, 更新状态
    notifyListeners();
  }
}
