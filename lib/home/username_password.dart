import 'package:flutter/material.dart';

class UsernameAndPassword extends StatelessWidget {

  TextEditingController _unameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'user name',
            hintText: 'please input your user name',
            errorText: 'cow',
            prefixIcon: Icon(Icons.person)
          ),
          controller: _unameController,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "password",
              hintText: "please input your password",
              prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
          onChanged: (v) {
            print('onChange:$v');
          },
        ),
        FlatButton(
          child: Text('获取输入的用户名'),
          textColor: Colors.lightBlue,
          onPressed: (){
            print(_unameController.text);
          },
        ),
      ],
    );
  }
}