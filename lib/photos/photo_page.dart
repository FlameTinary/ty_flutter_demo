import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ty_flutter_demo/widgets/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;

  Uint8List? imageBytes;

  ScreenshotController screenshotController = ScreenshotController();

  // 使用permission_handler插件来请求权限
  Future<bool> requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  // 使用image_gallery_saver插件可以将图片保存到手机相册
  void saveImage() async {
    if (await requestPermission() && imageBytes != null) {
      final result = await ImageGallerySaver.saveImage(imageBytes!);
      print('--- $result');
    }
  }

  // 返回上级页面
  void _back(context) {
    Navigator.pop(context);
  }

  // 获取单张图片的方法
  void _getPickture(context) async {
    // 使用image_picker插件打开相册
    try {
      final XFile? pickture =
          await _picker.pickImage(source: ImageSource.gallery);
      print(pickture);
    } catch (e) {
      _pickImageError = e;
      print(e);
    }
  }

  // 获取多张图片的方法
  void _getMultiPickture(context) async {
    // 使用image_picker插件打开相册
    try {
      final List<XFile> picktures = await _picker.pickMultiImage();
      print(picktures);
    } catch (e) {
      _pickImageError = e;
      print(e);
    }
  }

  void widgetToImage(BuildContext context) async {
    screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((capturedImage) async {
      setState(() {
        imageBytes = capturedImage;
      });
      saveImage();
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageBytes != null) Image.memory(imageBytes!),
            Screenshot(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ImagePickerWidget(),
                        ImagePickerWidget(),
                      ],
                    ),
                    Row(
                      children: [
                        ImagePickerWidget(),
                        ImagePickerWidget(),
                      ],
                    ),
                  ],
                ), controller: screenshotController),
            TextButton(
                onPressed: () => widgetToImage(context), child: Text('save')),
            TextButton(onPressed: () => _back(context), child: Text('back')),
          ],
        ),
      ),
    );
  }
}
