import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/home/value_listenable_demo.dart';
import 'error_textfield_demo.dart';
import 'tapbox_demo.dart';
import 'imgListDemo.dart';
import 'initial_page.dart';
import 'form_page.dart';
import 'layout_page.dart';
import 'animations/animation_demo_list.dart';
import 'painter_page.dart';
import 'nav_route_demo/route_animation.dart';
import 'inherited_count_demo.dart';
import 'provider_Inherited_demo/provider_demo.dart';

typedef CellFunc = void Function();

class CellItem {
  String title;
  String? subTitle;
  Widget? routePage;
  //CellFunc action;
  CellItem({Key? key, required this.title, this.routePage, this.subTitle});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _cells = [
    CellItem(
      title: '系统初始页面',
      subTitle: '官方案例',
      routePage: InitialPage(
        title: '初始页面',
      ),
    ),
    CellItem(
      title: '计数器案例',
      subTitle: 'inherited版本',
      routePage: InheritedCountPage(),
    ),
    CellItem(
      title: '计数器案例',
      subTitle: 'ValueListenableBuilder版本',
      routePage: ValueListenableDemo(),
    ),
    CellItem(
      title: 'custom provider',
      subTitle: '实现一个provider',
      routePage: CustomProviderDemo(),
    ),
    CellItem(
      title: '图片列表',
      subTitle: '图片 widget 的使用',
      routePage: ImageListDemo(),
    ),
    CellItem(
      title: '盒子模型页面',
      subTitle: '盒子模型练习',
      routePage: TapBoxDemo(),
    ),
    CellItem(
      title: '跳转到表单页面',
      subTitle: 'form 表单练习',
      routePage: FormPage(),
    ),
    CellItem(
      title: '跳转到错误提示页面',
      subTitle: 'error',
      routePage: ErrorTextFieldDemo(),
    ),
    CellItem(
      title: '转场动画',
      subTitle: '转场动画练习',
      routePage: RouteAnimationDemoList(),
    ),
    CellItem(
      title: '布局Demo',
      subTitle: '布局综合练习',
      routePage: LayoutPage(),
    ),
    CellItem(
      title: 'Animation Demo',
      subTitle: '动画练习',
      routePage: AnimationDemoList(),
    ),
    CellItem(
      title: '绘图页面',
      subTitle: '绘图白板',
      routePage: PainterDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: ListView.separated(
        itemCount: _cells.length,
        itemBuilder: (BuildContext context, int position) {
          CellItem item = _cells[position];
          return ListTile(
            title: Text(
              item.title,
              style: TextStyle(fontSize: 16.0),
            ),
            subtitle: Text(item.subTitle != null ? item.subTitle! : ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return item.routePage != null ? item.routePage! : Center();
                  },
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
