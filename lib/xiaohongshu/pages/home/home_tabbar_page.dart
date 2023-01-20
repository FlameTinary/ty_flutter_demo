import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ty_flutter_demo/xiaohongshu/models/common/resault_model.dart';
import 'package:ty_flutter_demo/xiaohongshu/models/home/home_model.dart';
import 'home_tabbar_item.dart';

class XHSTabPage extends StatefulWidget {
  const XHSTabPage({super.key, required this.text});

  final String text;

  @override
  State<XHSTabPage> createState() => _XHSTabPageState();
}

class _XHSTabPageState extends State<XHSTabPage> {
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
    _model = XhsHomeModel();
    loadData().then((XhsHomeModel value) {
      setState(() {
        _model = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        // 请求未结束
        if (snapshot.connectionState != ConnectionState.done)
          return CircularProgressIndicator();
        // 获取数据失败
        if (snapshot.hasError) return Text("error: ${snapshot.error}");

        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: MasonryGridView.count(
            itemCount: _model.data?.length,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              if (_model.data == null) {
                return Text("无数据");
              }
              Datum data = _model.data![index]!;
              return XHSTabViewItem(
                title: data.title!,
                accountName: data.user!.nickname!,
                avatar: data.user!.images!, 
                like: data.likes.toString(), poster: data.imagesList!.first!.url!,
              );
            },
          ),

          /// GridView实现,非瀑布流
          // child: GridView.builder(
          //   itemCount: 100,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 5.0,
          //     crossAxisSpacing: 5.0,
          //     childAspectRatio: 0.5,
          //   ),
          //   itemBuilder: (BuildContext context, int index) {
          //     return XHSTabViewItem();
          //   },
          // ),
        );
      },
    );
  }
}
