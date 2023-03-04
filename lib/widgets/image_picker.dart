import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  XFile? _pickture;
  

  // 获取单张图片的方法
  void _getPickture(context) async {
    // 使用image_picker插件打开相册
    try {
      final XFile? pickture =
          await _picker.pickImage(source: ImageSource.gallery);
      print(pickture);
      setState(() {
        _pickture = pickture;
      });
    } catch (e) {
      _pickImageError = e;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: _pickture != null
          ? Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: PhotoView(
                enablePanAlways: true,
                imageProvider: FileImage(File(_pickture!.path)),
              ),
            )
          : GestureDetector(
              onTap: () => _getPickture(context),
              child: Container(
                color: Colors.red,
                child: Icon(Icons.add, size: 50),
              ),
            ),
    );
  }
}
