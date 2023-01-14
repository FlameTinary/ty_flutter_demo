import 'package:flutter/material.dart';
import 'hero_to_page.dart';

class HeroFromPage extends StatefulWidget {
  const HeroFromPage({Key key}) : super(key: key);

  @override
  State<HeroFromPage> createState() => _HeroFromPageState();
}

class _HeroFromPageState extends State<HeroFromPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero from page'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Positioned(
              width: 100,
              height: 100,
              top: 50,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: HeroToPage(),
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: 'lake',
                  child: ClipOval(
                    child: Image.asset(
                      'images/lake.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
