import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/services/network/auth_network.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  bool isLogin = false;
  bool isCircleShown = false;
  bool hidePassword = true;

  GetStorage tokenBox = GetStorage();
  GetStorage authBox = GetStorage();

  void changeHidePassword() {
    hidePassword = !hidePassword;
    update();
  }

  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

  Future<void> registerApi({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
  }) async {
    try {
      await AuthApi.register(
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
              userName: userName)
          .then((value) async {
        await AuthApi.createUserToken(userName: userName, password: password)
            .then((token) async {
          tokenBox.write('token', token);
          await AuthApi.verifyUserToken(token: token);
          isCircleShown = false;
          isLogin = true;
          authBox.write('auth', isLogin);
          Get.toNamed(Routes.mainScreen);

          Get.snackbar('تم إنشاء الحساب بنجاح', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: whiteColor,
              duration: const Duration(seconds: 5),
              margin: const EdgeInsets.all(0),
              borderRadius: 0);

          update();
        });
      });
    } catch (e) {
      String title = e.toString().replaceAll('Exception: ', ' ');
      print(title);
      hideCircleIndicator();
      Get.snackbar('خطأ', title,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: whiteColor,
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
          duration: const Duration(seconds: 5));
    }
  }

  // login

  Future<void> loginApi({
    required String userName,
    required String password,
  }) async {
    try {
      await AuthApi.createUserToken(userName: userName, password: password)
          .then((token) async {
        tokenBox.write('token', token);
        await AuthApi.verifyUserToken(token: token);
        isCircleShown = false;
        isLogin = true;
        authBox.write('auth', isLogin);
        Get.toNamed(Routes.mainScreen);

        Get.snackbar('تم تسجيل الدخول بنجاح', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: whiteColor,
            duration: const Duration(seconds: 5),
            margin: const EdgeInsets.all(0),
            borderRadius: 0);

        update();
      });
    } catch (e) {
      String title = e.toString().replaceAll('Exception: ', ' ');
      print(title);
      hideCircleIndicator();
      Get.snackbar(title, '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: whiteColor,
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
          duration: const Duration(seconds: 5));
    }
  }

  void logOut() {
    tokenBox.remove('token');
    isLogin = false;
    authBox.write('auth', isLogin);
    Get.offAllNamed(Routes.loginScreen);
    print('logout');
  }
}
