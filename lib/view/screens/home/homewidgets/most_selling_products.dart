import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/products_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/screens/home/product_page/components/product_widget.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';

class MostSellingProductsWidget extends StatelessWidget {
  MostSellingProductsWidget({
    Key? key,
  }) : super(key: key);
  final storeController = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextWidget(
              text: 'المنتجات الأكثر مبيعاً',
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
              itemCount: storeController.productsMostSellingData!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 130,
                    height: 140,
                    child: GetBuilder<StoreController>(builder: (_) {
                      return ProductWidget(
                          isNetworkImg: true,
                          img: storeController
                              .productsMostSellingData![index].images![0].imgUrl
                              .toString(),
                          productName: storeController
                              .productsMostSellingData![index].productName
                              .toString(),
                          productPrice: storeController
                              .productsMostSellingData![index].price
                              .toString(),
                          iconsPadding: 5,
                          productNameSize: 10,
                          productPriceSize: 10);
                    }),
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
