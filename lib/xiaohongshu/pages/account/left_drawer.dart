import 'package:flutter/material.dart';

class MyLeftDrawer extends StatelessWidget {
  const MyLeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        // removeTop: true,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('data: $index'),
            );
          },
        ),
      ),
    );
  }
}
