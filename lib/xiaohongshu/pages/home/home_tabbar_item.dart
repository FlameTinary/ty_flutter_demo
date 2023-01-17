import 'package:flutter/material.dart';

class XHSTabViewItem extends StatelessWidget {
  const XHSTabViewItem(
      {super.key,
      required this.title,
      required this.avatar,
      required this.accountName,
      required this.like,
      required this.poster});

  final String title;
  final String avatar;
  final String accountName;
  final String like;
  final String poster; // 顶部图片

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部图片
          Image.network(poster),
          // 文字描述
          Padding(
            padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
            child: Text(title),
          ),
          // 用户信息 和 点赞信息
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              XHSAccountInfo(
                account: accountName,
                avatar: avatar,
              ),
              XHSLikeInfo(
                like: like,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class XHSAccountInfo extends StatelessWidget {
  const XHSAccountInfo(
      {super.key, required this.avatar, required this.account});

  final String avatar;
  final String account;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 3),
          width: 15,
          height: 15,
          child: ClipOval(child: Image.network(avatar)),
        ),
        Text(
          account,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}

class XHSLikeInfo extends StatelessWidget {
  const XHSLikeInfo({super.key, required this.like});

  final String like;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.heart_broken),
        Text(like),
      ],
    );
  }
}
