import 'package:flutter/material.dart';

class ErrorTextFieldDemo extends StatefulWidget {
  @override
  _ErrorTextFieldDemoState createState() => _ErrorTextFieldDemoState();
}

class _ErrorTextFieldDemoState extends State<ErrorTextFieldDemo> {

  String _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('带有错误提示的TextField'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (String text){
            setState(() {
              if (!isEmail(text)) {
                _errorText = 'Error: this is no a email';
              } else {
                _errorText = null;
              }
            });
          },
          decoration: InputDecoration(hintText: "this is a hint", errorText: _getErrorText()),
        ),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }
}