import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';

class CircleIndicatorWidget extends StatelessWidget {
  const CircleIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: index.isEven ? Colors.grey : primaryColor,
              shape: BoxShape.circle),
        );
      },
    );
  }
}
