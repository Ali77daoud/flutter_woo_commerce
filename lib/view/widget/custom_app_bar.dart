import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';

AppBar customAppBar({
  required String text,
  required double fontSize,
}) {
  return AppBar(
    backgroundColor: primaryColor,
    centerTitle: true,
    title: TextWidget(
        text: text,
        color: whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
        maxline: 1),
  );
}
