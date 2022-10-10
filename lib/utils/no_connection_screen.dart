import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/button_widget.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class NoConnectionScreen extends StatelessWidget {
  final onTap;
  const NoConnectionScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/no_connection.jpg',
              width: 80.w,
            )),
        Column(
          children: [
            TextWidget(
                text: 'لا يوجد اتصال بالإنترنت',
                color: blackColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 2),
            TextWidget(
                text: 'حاول لاحقاً',
                color: blackColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 2),
          ],
        ),
        Expanded(
            flex: 1,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ButtonWidget(
                    onTap: onTap,
                    text: TextWidget(
                        text: 'أعِد المحاولة',
                        color: whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxline: 2),
                    color: primaryColor,
                    radius: 15,
                    width: double.infinity,
                    height: 50),
              ),
            ]))
      ],
    );
  }
}
