import 'package:flutter/material.dart';

class HeroToPage extends StatelessWidget {
  const HeroToPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero to page'),
      ),
      body: Center(
        child: Hero(
          tag: 'lake',
          child: Image.asset('images/lake.jpg'),
        ),
      ),
    );
  }
}
