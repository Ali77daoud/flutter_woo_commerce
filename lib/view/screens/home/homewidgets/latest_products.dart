import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';

import '../product_page/components/product_widget.dart';

class LatestProductsWidget extends StatelessWidget {
  LatestProductsWidget({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextWidget(
              text: 'أحدث المنتجات',
              color: blackColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              maxline: 1),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 220,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.left,
            color: primaryColor,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: storeController.productsLatestData!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.productDetailsPage,
                        arguments: storeController.productsLatestData![index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                        width: 130,
                        height: 140,
                        child: GetBuilder<StoreController>(builder: (_) {
                          return ProductWidget(
                              onTapCart: () {},
                              onTapHeart: () {},
                              isNetworkImg: true,
                              img: storeController
                                  .productsLatestData![index].images![0].imgUrl
                                  .toString(),
                              productName: storeController
                                  .productsLatestData![index].productName
                                  .toString(),
                              productPrice: storeController
                                  .productsLatestData![index].price
                                  .toString(),
                              iconsPadding: 5,
                              productNameSize: 10,
                              productPriceSize: 10);
                        })),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
