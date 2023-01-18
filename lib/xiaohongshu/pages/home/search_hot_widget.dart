import 'package:flutter/material.dart';

class XHSSearchHotWidget extends StatelessWidget {
  const XHSSearchHotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 8.0),
          title: Text(
            '搜索发现',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return Text('data');
          },
          itemCount: 10,
        ),
      ],
    );
  }
}
