import 'dart:math';

import 'package:ty_flutter_demo/xiaohongshu/implements/model_imp.dart';

class XHSResaultModel implements ModelProtocol {
  int? code;
  bool? success;
  List<Map>? data;

  XHSResaultModel({this.code, this.success, this.data});

  XHSResaultModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    data = json['data'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) {
        final model = v as ModelProtocol;
        return model.toJson();
      }).toList();
    }
    return data;
  }
}
