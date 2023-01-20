import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ty_flutter_demo/xiaohongshu/common/notifications/drawer_notification.dart';
import '../../models/home/home_model.dart';
import '../home/home_tabbar_item.dart';

import 'package:fluttertoast/fluttertoast.dart';

class XHSMinePage extends StatefulWidget {
  const XHSMinePage({super.key});

  @override
  State<XHSMinePage> createState() => _XHSMinePageState();
}

class _XHSMinePageState extends State<XHSMinePage> {
  // 控制顶部用户头像是否显示
  bool _headerIsHidden = true;
  // tab 数据
  final _tabs = <String>['笔记', '收藏', '赞过'];

  late ScrollController? _controller;

  Future<XhsHomeModel> loadData() async {
    // 加载 json 文件
    String string = await rootBundle.loadString('assets/models/xhs.json');
    // 对加载的数据进行 decode
    Map<String, dynamic> jsonMap = json.decode(string);
    // 转换 model
    return XhsHomeModel.fromJson(jsonMap);
  }

  late XhsHomeModel _model;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        if (_controller!.offset >= 160.0) {
          if (_headerIsHidden != false) {
            setState(() {
              _headerIsHidden = false;
            });
          }
        } else {
          if (_headerIsHidden != true) {
            setState(() {
              _headerIsHidden = true;
            });
          }
        }
        print(_controller?.offset);
      });
    _model = XhsHomeModel();
    loadData().then((XhsHomeModel value) {
      print(value);
      setState(() {
        _model = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// 这里无法使用当前Scaffold自己的 drawer
    /// 因为底部导航栏不是当前 Scaffold 的, 所以如果使用自己的 drawer 会被底部导航栏遮挡
    /// 解决办法就是给底部导航栏的Scaffold添加一个 drawer, 给当前的 AppBar 添加一个左侧的按钮,
    /// 当点击按钮的时候会通知底部导航栏的Scaffold, 底部导航栏的Scaffold打开它的 drawer.
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        /*
        extendBodyBehindAppBar: true, // 创建透明/半透明 AppBar,需要将这个属性设置为 true
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          title: Text('我的'),
          actions: [
            IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "分享功能待完成",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              icon: Icon(Icons.share),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.reorder),
            onPressed: () {
              // 发送通知, 打开 drawer
              XHSDrawerNotification().dispatch(context);
            },
          ),
        ),
        */
        body: NestedScrollView(
          controller: _controller,
          // 顶部 AppBar
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.green,
                  // collapsedHeight: 60.0,
                  expandedHeight: 280.0,
                  pinned: true,
                  leading: IconButton(
                    icon: Icon(Icons.reorder),
                    onPressed: () {
                      // 发送通知, 打开 drawer
                      XHSDrawerNotification().dispatch(context);
                    },
                  ),
                  title: _headerIsHidden
                      ? Text('')
                      : ClipOval(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.network(
                                "https://sns-avatar-qc.xhscdn.com/avatar/61faaf8cac3510d0831026aa.jpg?imageView2/2/w/80/format/jpg"),
                          ),
                        ),
                  actions: [
                    _shareBtn(),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.only(
                          top: 90.0, left: 20, bottom: 40, right: 10),
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 用户信息
                          XHSMineUserInfo(
                            avatar:
                                "https://sns-avatar-qc.xhscdn.com/avatar/61faaf8cac3510d0831026aa.jpg?imageView2/2/w/80/format/jpg",
                            userName: '9527',
                            xhsNum: '9527',
                            ipAddres: '上海',
                          ),
                          // 简介
                          Text(
                            '点击这里, 填写简介',
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                          // 性别
                          _sexWidget(),
                          // 其他信息
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 数字信息
                              Row(
                                children: [
                                  _numberInfoWidget('117', '关注'),
                                  SizedBox(width: 10),
                                  _numberInfoWidget('117', '粉丝'),
                                  SizedBox(width: 10),
                                  _numberInfoWidget('117', '获赞与收藏'),
                                ],
                              ),
                              // 编辑资料和设置按钮
                              Row(
                                children: [
                                  _editAccountInfoBtn(),
                                  _settingBtn()
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    tabs: _tabs
                        .map((e) => Tab(
                              text: e,
                            ))
                        .toList(),
                  ),
                  // floating: true,
                ),
              ),
            ];
          },
          // page view 视图
          body: TabBarView(
            children: _tabs.map((e) {
              return Builder(builder: (context) {
                return CustomScrollView(
                  key: PageStorageKey<String>(e),
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(8.0),
                      sliver: buildSliverGrid(),
                    ),
                  ],
                );
              });
            }).toList(),
          ),
        ),
      ),
    );

    // 构建 tabBar
    //   return DefaultTabController(
    //     length: _tabs.length, // This is the number of tabs.
    //     child: Scaffold(
    //       body: NestedScrollView(
    //         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //           return <Widget>[
    //             SliverOverlapAbsorber(
    //               handle:
    //                   NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    //               sliver: SliverAppBar(
    //                 title: const Text('商城'),
    //                 floating: true,
    //                 snap: true,
    //                 forceElevated: innerBoxIsScrolled,
    //                 bottom: TabBar(
    //                   tabs: _tabs.map((String name) => Tab(text: name)).toList(),
    //                 ),
    //               ),
    //             ),
    //           ];
    //         },
    //         body: TabBarView(
    //           children: _tabs.map((String name) {
    //             return Builder(
    //               builder: (BuildContext context) {
    //                 return CustomScrollView(
    //                   key: PageStorageKey<String>(name),
    //                   slivers: <Widget>[
    //                     SliverOverlapInjector(
    //                       handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
    //                           context),
    //                     ),
    //                     SliverPadding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       sliver: buildSliverList(50),
    //                     ),
    //                   ],
    //                 );
    //               },
    //             );
    //           }).toList(),
    //         ),
    //       ),
    //     ),
    //   );
  }

  // 分享按钮组件
  _shareBtn() {
    return IconButton(
      onPressed: () {
        _showToast("分享功能待完成");
      },
      icon: Icon(Icons.share),
    );
  }

  // 性别组件
  _sexWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 30,
      height: 20,
      child: Icon(
        size: 15,
        Icons.male_rounded,
        color: Colors.blue.shade300,
      ),
    );
  }

  // 关注数/点赞数等
  _numberInfoWidget(String numberStr, String infoStr) {
    return Column(
      children: [
        Text(
          numberStr,
          style: TextStyle(fontSize: 10.0, color: Colors.white),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          infoStr,
          style: TextStyle(fontSize: 10.0, color: Colors.white),
        ),
      ],
    );
  }

  // 编辑资料按钮
  _editAccountInfoBtn() {
    return GestureDetector(
      onTapUp: (details) {
        _showToast("编辑资料按钮点击");
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        padding: EdgeInsets.only(left: 20, right: 20),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '编辑资料',
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
    );
  }

  // 设置按钮
  _settingBtn() {
    return GestureDetector(
      onTapUp: (details) {
        _showToast("设置按钮点击");
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          size: 18.0,
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }

  // toast 显示
  _showToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // 构建 sliver 类型的 list
  buildSliverList(int count) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Text('data $index');
        },
        childCount: count,
      ),
      itemExtent: 50.0,
    );
  }

  // 构建 sliver 类型的 grid
  buildSliverGrid() {
    return SliverMasonryGrid.count(
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childCount: _model.data?.length,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        if (_model.data == null) {
          return Text("无数据");
        }
        Datum data = _model.data![index]!;
        return XHSTabViewItem(
          title: data.title!,
          accountName: data.user!.nickname!,
          avatar: data.user!.images!,
          like: data.likes.toString(),
          poster: data.imagesList!.first!.url!,
        );
      },
    );
  }
}

class XHSMineUserInfo extends StatelessWidget {
  const XHSMineUserInfo(
      {super.key,
      required this.avatar,
      required this.userName,
      required this.xhsNum,
      required this.ipAddres});

  final String avatar; // 头像
  final String userName; // 用户名
  final String xhsNum; // 小红书号
  final String ipAddres; // ip 属地

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          // 头像视图
          ClipOval(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(avatar),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          // info 视图
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '$userName',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '小红书号: $xhsNum',
                style: TextStyle(fontSize: 10.0, color: Colors.white54),
              ),
              Text(
                'ip 属地: $ipAddres',
                style: TextStyle(fontSize: 10.0, color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
