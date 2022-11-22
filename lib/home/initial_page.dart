import 'package:flutter/material.dart';//导入包
import 'package:english_words/english_words.dart';
/**
 * Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的。
 * Stateful widget至少由两个类组成：
 *   *一个StatefulWidget类。
 *   *一个 State类； StatefulWidget类本身是不变的，但是 State类中持有的状态在widget生命周期中可能会发生变化。
 * _MyHomePageState类是MyHomePage类对应的状态类, 和MyApp 类不同
 * MyHomePage类中并没有build方法，取而代之的是
 * build方法被挪到了_MyHomePageState方法中，至于为什么这么做，先留个疑问，在分析完完整代码后再来解答。
 */
class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class RandomWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }

}
class _InitialPageState extends State<InitialPage> {
  //保存屏幕右下角带“➕”号按钮点击次数的状态
  int _counter = 0;
  //设置状态的自增函数
  void _incrementCounter() {
    //setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
    //会执行build方法来根据新的状态重新构建界面， Flutter 对此方法做了优化，
    //使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。
    setState(() {
      _counter++;
    });
  }

  //构建UI界面的逻辑在build方法中，当MyHomePage第一次创建时，_MyHomePageState类会被创建，
  //当初始化完成后，Flutter框架会调用Widget的build方法来构建widget树，
  //最终将widget树渲染到设备屏幕上。
  @override
  Widget build(BuildContext context) {
    //Scaffold 是 Material库中提供的一个widget, 
    //它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂。
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //body的widget树中包含了一个Center widget，
      //Center 可以将其子widget树对齐到屏幕中心， 
      //Center 子widget是一个Column widget，
      //Column的作用是将其所有子widget沿屏幕垂直方向依次排列， 
      //此例中Column包含两个 Text子widget，
      //第一个Text widget显示固定文本 “You have pushed the button this many times:”，
      //第二个Text widget显示_counter状态的数值。
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // style: Theme.of(context).textTheme.display1,
            ),
            RandomWordWidget(),
          ],
        ),
      ),
      //floatingActionButton是页面右下角的带“➕”的悬浮按钮，
      //它的onPressed属性接受一个回调函数，代表它本点击后的处理器，本例中直接将_incrementCounter作为其处理函数。
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
/**
 * 现在，我们将整个流程串起来：
 * 当右下角的floatingActionButton按钮被点击之后，会调用_incrementCounter，
 * 在_incrementCounter中，首先会自增_counter计数器（状态），
 * 然后setState会通知Flutter框架状态发生变化，接着，
 * Flutter会调用build方法以新的状态重新构建UI，最终显示在设备屏幕上。
 */