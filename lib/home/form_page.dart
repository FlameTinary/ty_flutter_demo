import 'package:flutter/material.dart';
import 'username_password.dart';
import 'focusDemo.dart';

class FormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新的页面'),
      ),
      body: ListView(
        children: <Widget>[
          UsernameAndPassword(),
          FocusDemo(),
        ],
      ),
    );
  }
  
}