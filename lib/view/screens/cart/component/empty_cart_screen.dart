import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/mainscreen_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/button_widget.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EmptyCartPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final mainController = Get.find<MainScreenController>();
  EmptyCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/empty_cart.png',
                width: 80.w,
              )),
          Column(
            children: [
              TextWidget(
                  text: 'سلّتك فارغة',
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxline: 2),
              TextWidget(
                  text: 'إذهب للتسوّق و قم بإضافة مشتريات جديدة',
                  color: blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                  maxline: 2),
            ],
          ),
          Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ButtonWidget(
                          onTap: () {
                            mainController.changeIndex(0);
                          },
                          text: TextWidget(
                              text: 'متابعة التسوّق',
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
      ),
    );
  }
}
