import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/logo_widget.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/search_navbar.dart';

class XHSHomePage extends StatefulWidget {
  const XHSHomePage({super.key});

  @override
  State<XHSHomePage> createState() => _XHSHomePageState();
}

class _XHSHomePageState extends State<XHSHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _tabCurrentIndex = 0;

  List<String> _tabs = [
    "关注",
    "推荐",
    "购物",
    "职场",
    "科技数码",
    "明星",
    "关注",
    "推荐",
    "购物",
    "职场",
    "科技数码",
    "明星"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: _tabCurrentIndex,
      length: _tabs.length,
      vsync: this,
    )..addListener(() {
        _tabCurrentIndex = _tabController.index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 控制导航条底部阴影
        elevation: 0,
        backgroundColor: Colors.white,
        // 导航条高度
        toolbarHeight: 44,
        // 搜索框
        title: XHSSearchNavBar(),
        // 导航条左边 logo
        leading: XHSLogo(),
        // 导航条底部 tab bar
        bottom: TabBar(
          indicator: const BoxDecoration(),
          padding: EdgeInsets.only(left: 5, right: 5),
          labelPadding: EdgeInsets.only(left: 5, right: 5),
          isScrollable: true,
          controller: _tabController,
          tabs: _tabs
              .mapIndexed((index, element) => Tab(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      child: Text(
                        element,
                        style: TextStyle(
                          color: index == _tabCurrentIndex
                              ? Colors.black54
                              : Colors.grey,
                          fontWeight: index == _tabCurrentIndex
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          onTap: (value) {
            setState(() {
              _tabCurrentIndex = value;
            });
          },
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
