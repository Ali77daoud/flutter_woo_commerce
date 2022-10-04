import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final spinKit = SpinKitPouringHourGlassRefined(
    color: primaryColor,
    size: 100,
    strokeWidth: 2,
  );

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () => goToHomeScreen());
  }

  goToHomeScreen() {
    // Get.offNamed(GetStorage().read<bool>('auth') == true
    //     ? Routes.mainScreen
    //     : Routes.loginScreen);
    Get.offNamed(Routes.mainScreen);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: whiteColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/tsaooq-logo.png',
                  width: 200,
                ),
              ),
              SizedBox(
                height: h * 0.2,
              ),
              spinKit,
            ],
          ),
        ],
      ),
    );
  }
}
