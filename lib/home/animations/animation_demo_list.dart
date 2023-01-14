import 'package:flutter/material.dart';
import './fade_animation_page.dart';
import './scale_animation_page.dart';

class AnimationDemoList extends StatefulWidget {
  const AnimationDemoList({Key key}) : super(key: key);

  @override
  State<AnimationDemoList> createState() => _AnimationDemoListState();
}

class _AnimationDemoListState extends State<AnimationDemoList> {
  List<AnimationCellModel> _cells = [];

  @override
  void initState() {
    _cells
      ..add(
        AnimationCellModel(
          'fade动画',
          routePage: AnimationDemo(),
        ),
      )
      ..add(
        AnimationCellModel(
          'scale动画',
          subtitle: '未优化的原始写法',
          routePage: ScaleAnimationPage(),
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation list'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            AnimationCellModel cellM = _cells[index];
            return ListTile(
              title: Text(cellM.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return cellM.routePage;
                    },
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: _cells.length),
    );
  }
}

class AnimationCellModel {
  String title;
  String subtitle;
  Widget routePage;

  AnimationCellModel(this.title, {this.subtitle, this.routePage});
}
