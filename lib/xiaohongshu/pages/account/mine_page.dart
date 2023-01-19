import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/xiaohongshu/common/notifications/drawer_notification.dart';

import 'left_drawer.dart';

class XHSMinePage extends StatelessWidget {
  const XHSMinePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 这里无法使用当前Scaffold自己的 drawer
    /// 因为底部导航栏不是当前 Scaffold 的, 所以如果使用自己的 drawer 会被底部导航栏遮挡
    /// 解决办法就是给底部导航栏的Scaffold添加一个 drawer, 给当前的 AppBar 添加一个左侧的按钮,
    /// 当点击按钮的时候会通知底部导航栏的Scaffold, 底部导航栏的Scaffold打开它的 drawer.
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        leading: IconButton(
          icon: Icon(Icons.reorder),
          onPressed: () {
            // 发送通知, 打开 drawer
            XHSDrawerNotification().dispatch(context);
          },
        ),
      ),
      body: Center(
        child: Text('mine'),
      ),
    );
  }
}
