import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class XHSSearchLikeWidget extends StatelessWidget {
  const XHSSearchLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '猜你想搜',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '换一换',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff999999),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 100.0,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5.0, //显示区域宽高相等
              ),
              children: [
                Text('悬疑小说'),
                Text('苹果图书'),
                Text('美剧头像'),
                Text('夏威夷大岛攻略'),
                Text('霍华德'),
                Text('摩登家庭哪里看'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
