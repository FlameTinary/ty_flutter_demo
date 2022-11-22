import 'package:flutter/material.dart';

class FocusDemo extends StatefulWidget {

  @override
  _focusState createState() => _focusState();
  
}

class _focusState extends State<FocusDemo> {

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: 'label1',
              hintText: 'input label1',
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: 'label2',
              hintText: 'input label2',
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: <Widget>[
                // RaisedButton(
                //   child: Text('move focus'),
                //   onPressed: (){
                //     if (null == focusScopeNode) {
                //       focusScopeNode = FocusScope.of(context);
                //     }
                //     focusScopeNode.requestFocus(focusNode2);
                //   },
                // ),
                // RaisedButton(
                //   child: Text('Hidden keyboard'),
                //   onPressed: (){
                //     focusNode1.unfocus();
                //     focusNode2.unfocus();
                //   },
                // ),
              ],
            );
          }),
        ],
      ),
    );
  }
}