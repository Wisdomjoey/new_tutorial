import 'package:flutter/cupertino.dart';

class smallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  smallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.height = 1.2,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: 'Roboto', color: color, fontSize: size, height: height),
    );
  }
}
