import 'package:flutter/material.dart';

class ProviderTestList extends StatefulWidget {
  const ProviderTestList({super.key});

  @override
  State<ProviderTestList> createState() => _ProviderTestListState();
}

class _ProviderTestListState extends State<ProviderTestList> {
  List<ProviderBaseCellModel> _items = [
    ProviderBaseCellModel(
      title: "provider",
      subTitle: "基础provider的使用",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "ChangeNotifierProvider",
      subTitle: "监听模型对象的变化，而且当数据改变时，它也会重建Consumer，更新UI",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "FutureProvider",
      subTitle: "FutureProvider有一个初始值，接收一个 Future，并在其进入 complete 状态时更新依赖它的组件",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "StreamProvider",
      subTitle: "监听流，并暴露出当前的最新值，并多次触发重新构建UI",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "MultiProvder",
      subTitle: "多种Provder的集合",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "ProxyProvider",
      subTitle: "将多个 provider 的值聚合为一个新对象",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "ChangeNotifierProxyProvider",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "ListenableProvider",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "ListenableProxyProvider",
      callback: () {
        print("push to provider base test");
      },
    ),
    ProviderBaseCellModel(
      title: "ValueListenableProvider",
      callback: () {
        print("push to provider base test");
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("provider 练习")),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index].title),
            subtitle: _items[index].subTitle != null
                ? Text(_items[index].subTitle!)
                : null,
            onTap: _items[index].callback,
          );
        },
      ),
    );
  }
}

class ProviderBaseCellModel {
  ProviderBaseCellModel(
      {required this.title, required this.callback, this.subTitle});
  String title;
  String? subTitle;
  void Function() callback;
}
