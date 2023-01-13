import 'package:flutter/material.dart';
import 'error_textfield_demo.dart';
import 'tapbox_demo.dart';
import 'imgListDemo.dart';
import 'initial_page.dart';
import 'form_page.dart';
import 'layout_page.dart';
import 'animation_page.dart';
import 'painter_page.dart';

typedef CellFunc = void Function();

class CellItem {
  String text;
  //CellFunc action;
  CellItem({Key key, @required this.text});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _cells = [
    CellItem(text: '系统初始页面'),
    CellItem(text: '图片列表'),
    CellItem(text: '盒子模型页面'),
    CellItem(text: '跳转到表单页面'),
    CellItem(text: '跳转到错误提示页面'),
    CellItem(text: '布局Demo'),
    CellItem(text: 'Animation Demo'),
    CellItem(text: '绘图页面'),
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
          return _getCell(position);
        },
        separatorBuilder:(context, index) => const Divider(),
      ),
    );
  }

  Widget _getCell(int i) {
    CellItem item = _cells[i];
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(item.text, style: TextStyle(
          fontSize: 16.0,
        ),),
      ),
      onTap: (){
        if (i == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return InitialPage(title: '初始页面',);
          }));
        } else if (i == 1){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ImageListDemo();
          }));
        } else if (i == 2){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return TapBoxDemo();
          }));
        } else if (i == 3){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormPage();
          }));
        } else if (i == 4){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ErrorTextFieldDemo();
          }));
        } else if (i == 5) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return LayoutPage();
          }));
        } else if (i == 6) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AnimationDemo();
          }));
        } else if (i == 7) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return PainterDemo();
          }));
        } else {
          print('没有跳转任务');
        }
      },
    );
  }

  // List _initData() {
  //   return 
  // }

}