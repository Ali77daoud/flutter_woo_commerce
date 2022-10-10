import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:get/get.dart';
import '../../../widget/buy_widget.dart';
import 'components/products_info.dart';
import 'components/image_slider.dart';

class ProductDetailsPage extends StatelessWidget {
  final storeController = Get.find<StoreController>();
  ProductDetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: whiteColor,
            body: GetBuilder<StoreController>(builder: (_) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ImageSlider(
                              img: Get.arguments.images![0].imgUrl.toString(),
                            ),
                            ProductsInfo(
                              title: Get.arguments.productName.toString(),
                              discription: Get.arguments.description.toString(),
                            ),
                          ],
                        );
                      },
                      itemCount: 1,
                    ),
                  ),
                  BuyWidget(
                    firstText: 'السعر',
                    buttonText: 'أضف للسلّة',
                    price: '${Get.arguments.price.toString()} ل.س',
                    ontab: () {},
                  ),
                ],
              );
            })),
      ),
    );
  }
}
