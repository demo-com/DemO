import 'package:flutter/widgets.dart';

class BottomWaveClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 80, size.height -170.0, size.width / 2, size.height - 140.0);
    path.quadraticBezierTo(size.width - (size.width / 8), size.height-120.0,
        size.width, size.height - 230.0);
    path.lineTo(size.width,0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class TopWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-120.0);
    path.quadraticBezierTo(size.width - (size.width / 2), size.height+120.0,
        size.width, size.height-120.0);
    path.lineTo(size.width,0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}