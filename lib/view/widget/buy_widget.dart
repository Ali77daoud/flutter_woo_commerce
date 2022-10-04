import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/button_widget.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class BuyWidget extends StatelessWidget {
  final String price;
  final String firstText;
  final String buttonText;
  final ontab;
  const BuyWidget(
      {required this.price,
      required this.ontab,
      Key? key,
      required this.firstText,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                      text: firstText,
                      // 'السعر',
                      color: blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 1),
                  TextWidget(
                    text: price,
                    color: blackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ButtonWidget(
                  onTap: ontab,
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                          text: buttonText,
                          // 'أضف للسلّة',
                          color: whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                          maxline: 1),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 20.sp,
                      ),
                    ],
                  ),
                  color: primaryColor,
                  radius: 15,
                  width: double.infinity,
                  height: 50),
            ),
          ],
        ),
      ),
    );
  }
}
