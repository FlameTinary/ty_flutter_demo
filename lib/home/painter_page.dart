import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = Colors.red
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;
    for (var i = 0; i < points.length; i++) {
      if (points[i] != null && points[i+1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class PainterDemo extends StatefulWidget {
  @override
  _PainterDemoState createState() => _PainterDemoState();
}

class _PainterDemoState extends State<PainterDemo> {

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('绘图'),),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details){
          setState(() {
            RenderBox referenceBox = context.findRenderObject() as RenderBox;
            Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
            _points = List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(Offset(0.0, 0.0)),
        child: CustomPaint(painter: SignaturePainter(_points), size: Size.infinite,),
      ),
    );
  }
}