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
              Expanded(
                flex: 2,
                child: XHSAccountInfo(
                  account: accountName,
                  avatar: avatar,
                ),
              ),
              Expanded(
                flex: 1,
                child: XHSLikeInfo(
                  like: like,
                ),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: ClipOval(
            child: Image.network(avatar),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 3),
            child: Text(
              account,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF333333),
              ),
            ),
          ),
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Icon(Icons.heart_broken),
        ),
        Text(
          like,
          style: TextStyle(
              color: Color(0xFF999999), overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
