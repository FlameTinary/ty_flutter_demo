import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:ty_flutter_demo/xiaohongshu/models/home/home_model.dart';

class XHSVideosPage extends StatefulWidget {
  const XHSVideosPage({super.key});

  @override
  State<XHSVideosPage> createState() => _XHSVideosPageState();
}

class _XHSVideosPageState extends State<XHSVideosPage> {
  List<VideoModel> _items = [
    VideoModel(
      coverImgPath: "assets/videos/IMG_3349.jpg",
      videoPath: "assets/videos/v0300fg10000cf6i33bc77u1l5lhaut0.MP4",
    ),
    VideoModel(
      coverImgPath: "assets/videos/IMG_3351.jpg",
      videoPath: "assets/videos/v0d00fg10000cf6c32bc77ufna4efd40.MP4",
    ),
    VideoModel(
      coverImgPath: "assets/videos/IMG_3353.jpg",
      videoPath: "assets/videos/v0d00fg10000cf6l3cjc77u54lrg1fkg.MP4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('视频')),
      body: PageView.builder(
        itemCount: _items.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          VideoModel item = _items[index];
          final vw = MediaQuery.of(context).size.width;
          final vh = MediaQuery.of(context).size.height;
          return Container(
            width: vw,
            height: vh,
            color: Colors.black,
            child: Image.asset(
              item.coverImgPath,
              fit: BoxFit.fitWidth,
            ),
          );
        },
      ),
    );
  }

  int random(int min, int max) {
    final _random = math.Random();
    return min + _random.nextInt(max - min + 1);
  }

  Color randomColor() {
    return Color.fromARGB(
        random(150, 255), random(0, 255), random(0, 255), random(0, 255));
  }
}

class VideoModel {
  VideoModel({required this.coverImgPath, required this.videoPath});
  String coverImgPath;
  String videoPath;
}
