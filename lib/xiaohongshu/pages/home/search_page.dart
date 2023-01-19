import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/search_history_widget.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/search_hot_widget.dart';
import 'package:ty_flutter_demo/xiaohongshu/pages/home/search_like_widget.dart';

class XHSSearchPage extends StatefulWidget {
  const XHSSearchPage({super.key});

  @override
  State<XHSSearchPage> createState() => _XHSSearchPageState();
}

class _XHSSearchPageState extends State<XHSSearchPage> {
  List<Widget> _items = [];

  @override
  void initState() {
    super.initState();
    _items
      ..add(XHSSearchHistoryWidget())
      ..add(XHSSearchLikeWidget())
      ..add(XHSSearchHotWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              '取消',
              style: TextStyle(color: Color(0xff999999)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: CupertinoSearchTextField(
          itemSize: 15.0,
          prefixInsets: EdgeInsetsDirectional.fromSTEB(10, 3, 0, 4),
          placeholder: '搜索',
          placeholderStyle: TextStyle(color: Colors.black26),
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xff666666),
          ),
          autofocus: true,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black12),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: XHSSearchHistoryWidget(),
          ),
          SliverToBoxAdapter(
            child: XHSSearchLikeWidget(),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 8.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                '搜索发现',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // 创建列表
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('我在博物馆和自己合照'), Text('1100.9w')],
                  );
                },
                childCount: 10,
              ),
              itemExtent: 50,
            ),
          )
        ],
      ),
    );
  }
}