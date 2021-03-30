import 'package:flutter/material.dart';
import 'package:meta/meta.dart';



class CurveHeaderPainter extends CustomPainter{
  final List<int> colors;

  CurveHeaderPainter({ @required this.colors});

  
  @override
  void paint(Canvas canvas, Size size) {
      final paint = new Paint();
      //Properties
      paint.color = Color.fromRGBO(colors[0], colors[1], colors[2], 1);
      paint.style = PaintingStyle.fill; //.stroke
      paint.strokeWidth = 5;

      final path = new Path();
      // Draw with path and paint
      path.lineTo(0, size.height*0.55);
      //path.quadraticBezierTo(size.width*0.5, size.height, size.width, size.height*0.45);
      path.quadraticBezierTo(size.width*0.08, size.height, size.width*.5, size.height);
      path.quadraticBezierTo(size.width-size.width*0.08, size.height, size.width, size.height*0.55);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);


    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    //throw UnimplementedError();
  }

}