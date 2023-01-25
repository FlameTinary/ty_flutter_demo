import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:video_player/video_player.dart';

class XHSVideosPage extends StatefulWidget {
  const XHSVideosPage({super.key});

  @override
  State<XHSVideosPage> createState() => _XHSVideosPageState();
}

class _XHSVideosPageState extends State<XHSVideosPage> {
  // 数据
  List<VideoModel> _items = [
    VideoModel(
      coverImgPath: "assets/videos/IMG_3349.jpg",
      coverImgHidden: false,
      videoPath: "assets/videos/v0300fg10000cf6i33bc77u1l5lhaut0.MP4",
    ),
    VideoModel(
      coverImgPath: "assets/videos/IMG_3351.jpg",
      coverImgHidden: false,
      videoPath: "assets/videos/v0d00fg10000cf6c32bc77ufna4efd40.MP4",
    ),
    VideoModel(
      coverImgPath: "assets/videos/IMG_3353.jpg",
      coverImgHidden: false,
      videoPath: "assets/videos/v0d00fg10000cf6l3cjc77u54lrg1fkg.MP4",
    ),
  ];

  // 视频播放控制器
  late VideoPlayerController _controller;
  late PageController _pageController;
  // late Future<void> _initializeVideoPlayerFuture;

  int _currentPageIndex = 0;

  // 更新数据封面
  updateItem(index) {
    setState(() {
      _items[index].coverImgHidden = true;
    });
  }

  // 更新当前 index
  updateCurrentPageIndex(index) {
    // 移除上一个视频的 controller
    _controller.dispose();  

    // 把所有封面设置为可见
    for (VideoModel item in _items) {
      item.coverImgHidden = false;
    }

    // 将当前视频封面设置为不可见
    _items[index].coverImgHidden = true;

    // new 一个新的 controller
    getVideoController(_items[index].videoPath);
  }

  // 生成新的 video controller
  getVideoController(String path) {
    _controller = VideoPlayerController.asset(path)
      ..initialize().then((value) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        // print(_pageController.page?.floor());
      });
    if (_items.length > 0) {
      _items.first.coverImgHidden = true;
      getVideoController(_items.first.videoPath);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('视频')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _items.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          VideoModel item = _items[index];
          final vw = MediaQuery.of(context).size.width;
          final vh = MediaQuery.of(context).size.height;
          return Container(
            color: Colors.black,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                item.coverImgHidden
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    // ? Text("当前视频")
                    : Image.asset(
                        width: vw,
                        height: vh,
                        item.coverImgPath,
                        fit: BoxFit.fitWidth,
                      ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          updateItem(index);
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      )),
                ),
              ],
            ),
          );
        },
        onPageChanged: (index) {
          print("current page index = $index");
          updateCurrentPageIndex(index);
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
  VideoModel(
      {required this.coverImgPath,
      required this.videoPath,
      required this.coverImgHidden});
  String coverImgPath;
  String videoPath;
  bool coverImgHidden;
}
