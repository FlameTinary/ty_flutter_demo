import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/account/qr_scan_page.dart';

class MyLeftDrawer extends StatefulWidget {
  const MyLeftDrawer({super.key});

  @override
  State<MyLeftDrawer> createState() => _MyLeftDrawerState();
}

class _MyLeftDrawerState extends State<MyLeftDrawer> {
  final List<DrawerItemModel> _items = [
    DrawerItemModel(icon: Icon(Icons.person_add), title: "发现好友"),
    DrawerItemModel(icon: Icon(Icons.person_add), title: "小红市迎新年"),
    DrawerItemModel(icon: Icon(Icons.all_inbox), title: "创作中心"),
    DrawerItemModel(icon: Icon(Icons.person_add), title: "我的草稿"),
    DrawerItemModel(icon: Icon(Icons.history), title: "浏览记录"),
    DrawerItemModel(icon: Icon(Icons.payment), title: "钱包"),
    DrawerItemModel(icon: Icon(Icons.sd_card), title: "免流量"),
    DrawerItemModel(icon: Icon(Icons.redeem), title: "好物体验"),
    DrawerItemModel(icon: Icon(Icons.assignment), title: "订单"),
    DrawerItemModel(icon: Icon(Icons.shopping_cart), title: "购物车"),
    DrawerItemModel(icon: Icon(Icons.sell), title: "卡券"),
    DrawerItemModel(icon: Icon(Icons.integration_instructions), title: "心愿单"),
    DrawerItemModel(icon: Icon(Icons.face), title: "小红卡会员"),
    DrawerItemModel(icon: Icon(Icons.yard), title: "社区公约"),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        // removeTop: true,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                // itemExtent: 50.0,
                itemBuilder: (context, index) {
                  DrawerItemModel item = _items[index];
                  if (index == 0 || index == 7 || index == 12) {
                    return Column(
                      children: [
                        ListTile(
                          leading: item.icon,
                          title: Text(item.title),
                        ),
                        Divider()
                      ],
                    );
                  }
                  return ListTile(
                    leading: item.icon,
                    title: Text(item.title),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  XHSIconBtn(
                    icon: Icon(
                      Icons.settings,
                      color: Color(0xff999999),
                      size: 15.0,
                    ),
                    title: '设置',
                    action: () {},
                  ),
                  XHSIconBtn(
                    icon: Icon(
                      Icons.support_agent,
                      color: Color(0xff999999),
                      size: 15.0,
                    ),
                    title: '帮助与客服',
                    action: () {},
                  ),
                  // 扫一扫按钮
                  XHSIconBtn(
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: Color(0xff999999),
                      size: 15.0,
                    ),
                    title: '扫一扫',
                    action: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QRViewExample();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class XHSIconBtn extends StatelessWidget {
  const XHSIconBtn(
      {super.key,
      required this.title,
      required this.icon,
      required this.action});
  final String title;
  final Icon icon;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        if (action != null) {
          action();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(10.0),
              child: icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              title,
              style: TextStyle(color: Color(0xff666666), fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItemModel {
  DrawerItemModel({required this.icon, required this.title, this.action});
  final Icon icon;
  final String title;
  final Function()? action;
}
