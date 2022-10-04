import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  final Widget text;
  final Color color;
  final double radius;
  final double width;
  final double height;

  const ButtonWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.radius,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: text,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
