import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/inherited_provider.dart';

// 这个类是订阅者, 用来重新构建InheritedProvider
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider({
    super.key,
    required this.data,
    required this.child,
  });

  final Widget child;
  final T data;

  // 定义一个便捷方法, 便于子 widget 方便的获取共享数据
  static T? of<T>(BuildContext context) {
    final data = context
        .dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        ?.data;

    return data;
  }

  //FIXME: 自动生成的代码一定不要忘记修改这里
  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

//FIXME: 自动生成的代码一定不要忘记修改这里
class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  // 数据更新时调用这个方法
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 初始化的时候为发布者绑定监听
    widget.data.addListener(update);
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    // 如果旧数据和新数据不同,则解绑旧数据,同时监听新数据
    if (oldWidget.data != widget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    // 组件销毁的时候移除发布者的监听
    widget.data.removeListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(child: widget.child, data: widget.data,);
  }
}
