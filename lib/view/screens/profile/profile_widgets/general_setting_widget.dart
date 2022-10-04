import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';

class GeneralSetting extends StatelessWidget {
  final Widget leftPart;
  final String text;
  final Widget rightPart;
  const GeneralSetting(
      {required this.leftPart,
      required this.text,
      required this.rightPart,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: leftPart,
            ),
            Expanded(
              flex: 4,
              child: TextWidget(
                text: text,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxline: 1,
              ),
            ),
            Expanded(flex: 2, child: rightPart),
          ],
        ),
      ],
    );
  }
}
