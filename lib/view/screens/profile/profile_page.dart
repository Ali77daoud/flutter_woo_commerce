import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/auth_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/screens/profile/profile_widgets/card_util.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';
import 'profile_widgets/general_setting_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardUtils(
              ifNetworkImage: false,
              img: 'assets/images/user.png',
              title: 'Ali Daoud',
              underText: 'ali.daoud@gmail.com',
              textcolor: Get.isDarkMode ? Colors.white : Colors.black,
              firstIcon: Container(
                width: 0,
              ),
              flex: 0,
              secondIcon: Container(
                width: 0,
              ),
            ),

            ///////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextWidget(
                text: 'عام',
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
                textAlign: TextAlign.start,
                maxline: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: GeneralSetting(
                        leftPart: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigoAccent.shade100),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: whiteColor,
                              size: 20,
                            )),
                        text: 'الطلبات',
                        rightPart: Container()),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {},
                    child: GeneralSetting(
                      leftPart: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade500),
                          child: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 20,
                          )),
                      text: 'تفاصيل الملف الشخصي',
                      rightPart: Container(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: 'هل أنت متأكد من تسجيل الخروج ؟',
                          titleStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          middleText: '',
                          middleTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          radius: 15,
                          backgroundColor: Colors.grey.shade400,
                          textCancel: 'رجوع',
                          cancelTextColor: Colors.black,
                          buttonColor: primaryColor,
                          textConfirm: 'تأكيد',
                          confirmTextColor: Colors.black,
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            authController.logOut();
                          });
                    },
                    child: GeneralSetting(
                      leftPart: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade200),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 20,
                          )),
                      text: 'تسجيل الخروج',
                      rightPart: Container(
                        width: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
