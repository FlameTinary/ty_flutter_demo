import 'package:flutter/material.dart';

class XHSSearchHistoryWidget extends StatelessWidget {
  const XHSSearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '历史记录',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.restore_from_trash),
            ],
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              spacing: 8.0,
              alignment: WrapAlignment.start,
              children: [
                Chip(
                  backgroundColor: Colors.grey.shade200,
                  label: Text('react开发'),
                  labelStyle: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14.0,
                  ),
                ),
                Chip(
                  backgroundColor: Colors.grey.shade200,
                  label: Text('flutter 开发'),
                  labelStyle: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14.0,
                  ),
                ),
                Chip(
                  backgroundColor: Colors.grey.shade200,
                  label: Text('原生开发'),
                  labelStyle: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14.0,
                  ),
                ),
                Chip(
                  backgroundColor: Colors.grey.shade200,
                  label: Text('小程序开发'),
                  labelStyle: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
