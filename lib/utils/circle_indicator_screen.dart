import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/view/widget/circle_indicator_widget.dart';

class CircleIndicatorScreen extends StatelessWidget {
  const CircleIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        CircleIndicatorWidget()
      ],
    );
  }
}
