import 'package:flutter/material.dart';

/// 继承自InheritedWidget, 用于保存 count 数据
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({Key key, @required Widget child, @required this.data})
      : super(key: key, child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    /// 这个方法会注册依赖关系
    /// 如果使用这个方法InheritedWidget和依赖它的子孙组件关系便完成了注册，
    /// 之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，
    /// 也就是会调这些子孙组件的didChangeDependencies()方法和build()方法。
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();

    // 这个方法不会注册依赖关系
    return context
        .getElementForInheritedWidgetOfExactType<ShareDataWidget>()
        .widget;
  }

  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

/// 封装一个用于显示 count 的 widget
class _TextCountWidget extends StatefulWidget {
  const _TextCountWidget({Key key}) : super(key: key);

  @override
  State<_TextCountWidget> createState() => __TextCountWidgetState();
}

class __TextCountWidgetState extends State<_TextCountWidget> {
  String _getCountString(BuildContext context) {
    if (ShareDataWidget.of(context) != null &&
        ShareDataWidget.of(context).data != null) {
      return ShareDataWidget.of(context).data.toString();
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Text("Count: ${_getCountString(context)}");
  }

  @override
  void didChangeDependencies() {
    // 如果ShareDataWidget中的数据发生改变,则会调用这个方法
    print('didChangeDependencies');
    super.didChangeDependencies();
  }
}

/// 点击按钮改变保存在 InheritedWidget 中的 count
class InheritedCountPage extends StatefulWidget {
  const InheritedCountPage({Key key}) : super(key: key);

  @override
  State<InheritedCountPage> createState() => _InheritedCountPageState();
}

class _InheritedCountPageState extends State<InheritedCountPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited count'),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: _TextCountWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // 修改ShareDataWidget中的 data
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
