import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/auth_controller.dart';
import 'package:flutter_woocommerce/logic/controllers/products_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/no_connection_screen.dart';
import 'package:flutter_woocommerce/view/screens/home/homewidgets/latest_products.dart';
import 'package:flutter_woocommerce/view/screens/home/homewidgets/most_selling_products.dart';
import 'package:get/get.dart';
import '../../widget/circle_indicator_widget.dart';
import 'homeWidgets/slider.dart';
import 'homewidgets/cateogries_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final storeController = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (_) {
      return storeController.noInternetConnection
          ? NoConnectionPage(
              onTap: () async {
                storeController.hideNoInternetPage();
                await storeController.getHomePageData();
              },
            )
          : storeController.isCircleShown
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Center(child: CircleIndicatorWidget())],
                )
              : RefreshIndicator(
                  backgroundColor: whiteColor,
                  color: primaryColor,
                  onRefresh: () async {
                    await storeController.getHomePageData();
                    // storeController.showCircleIndicator();
                    // await storeController.getCategories().then((value) async {
                    //   await storeController.getProducts().then(
                    //     (value) {
                    //       storeController.hideCircleIndicator();
                    //     },
                    //   );
                    // });
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
                );
    });
  }
}
