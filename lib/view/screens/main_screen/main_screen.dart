import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/no_connection_screen.dart';
import 'package:flutter_woocommerce/view/screens/main_screen/nav_bar.dart';
import 'package:flutter_woocommerce/view/widget/circle_indicator_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());
  final token = GetStorage().read('token');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: primaryColor,
        child: SafeArea(child: Scaffold(
          body: GetBuilder<StoreController>(builder: (_) {
            return storeController.noInternetConnectionProducts
                ? NoConnectionScreen(
                    onTap: () async {
                      storeController.hideNoInternetPageProducts();
                      await storeController.getHomePageData(token: token);
                    },
                  )
                : storeController.isCircleProductsShown
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(child: CircleIndicatorWidget())
                        ],
                      )
                    : NavBar();
          }),
        )),
      ),
    );
  }
}
