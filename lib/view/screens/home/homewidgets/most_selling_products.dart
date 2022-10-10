import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/screens/home/product_page/components/product_widget.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MostSellingProductsWidget extends StatelessWidget {
  MostSellingProductsWidget({
    Key? key,
  }) : super(key: key);
  final storeController = Get.put(StoreController());
  final token = GetStorage().read('token');
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
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.productDetailsPage,
                        arguments:
                            storeController.productsMostSellingData![index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 130,
                      height: 140,
                      child: GetBuilder<StoreController>(builder: (_) {
                        return ProductWidget(
                            onTapCart: () async {
                              storeController.showCircleCartIndicator();
                              await storeController.addToCart(
                                  token: token.toString(),
                                  productId: storeController
                                      .productsMostSellingData![index].id
                                      .toString(),
                                  quantity: '1');
                            },
                            onTapHeart: () {},
                            isNetworkImg: true,
                            img: storeController.productsMostSellingData![index]
                                .images![0].imgUrl
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
