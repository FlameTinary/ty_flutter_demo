import 'package:flutter/material.dart';

class ImageListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图片'),),
      body: ListView(
        children: <Widget>[
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
          new Image.network('https://szimg.mukewang.com/5c7e6835087ef3d806000338-360-202.jpg'),
        ],
      ),
    );
  }
}