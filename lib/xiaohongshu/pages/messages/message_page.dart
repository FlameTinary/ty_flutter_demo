import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ty_flutter_demo/xiaohongshu/models/message/open_model.dart';

class XHSMessagePage extends StatefulWidget {
  const XHSMessagePage({super.key});

  @override
  State<XHSMessagePage> createState() => _XHSMessagePageState();
}

class _XHSMessagePageState extends State<XHSMessagePage> {
  String text = '';
  String completion = '';

  _getMessage() async {
    Response? response;
    var dio = Dio();
    dio.options.baseUrl = 'https://api.openai.com/v1';
    dio.options.headers = {
      "Content-Type": " application/json",
      "Accept-Encoding": "gzip",
      "Transfer-Encoding": "chunked",
      "Authorization":
          "",
    };
    // 发起网络请求
    try {
      response = await dio.post('/completions', data: {
        "model": "text-davinci-003",
        "prompt": text,
        "max_tokens": 2048,
        "temperature": 0,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0.6,
        "stop": [" Human:", " AI:"]
      });
    } on DioError catch (e) {
      print(e.message);
    }

    // print(response.data.toString());
    OpenModel om = OpenModel.fromJson(response?.data);
    print(om.toJson());
    setState(() {
      completion = om.choices.first.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息')),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                text = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _getMessage();
              },
              child: Text('发送'),
            ),
            if (completion.length > 0) Text(completion),
          ],
        ),
      ),
    );
  }
}
