import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/circle_indicator_screen.dart';
import 'package:flutter_woocommerce/view/screens/home/homewidgets/latest_products.dart';
import 'package:flutter_woocommerce/view/screens/home/homewidgets/most_selling_products.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'homeWidgets/slider.dart';
import 'homewidgets/cateogries_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  final cartKey = GetStorage().read('cartKey');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (_) {
      return Stack(
        children: [
          RefreshIndicator(
            backgroundColor: whiteColor,
            color: primaryColor,
            onRefresh: () async {
              await storeController.getHomePageData(cartKey: cartKey);
            },
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopSlider(),
                    const SizedBox(
                      height: 10,
                    ),
                    CategoriesItems(),
                    const SizedBox(
                      height: 10,
                    ),
                    MostSellingProductsWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    LatestProductsWidget(),
                  ],
                ),
              ),
            ),
          ),
          storeController.isCircleCartShown
              ? const CircleIndicatorScreen()
              : Container(),
        ],
      );
    });
  }
}
