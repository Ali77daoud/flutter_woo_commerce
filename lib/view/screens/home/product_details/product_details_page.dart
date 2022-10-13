import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/circle_indicator_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../widget/buy_widget.dart';
import 'components/products_info.dart';
import 'components/image_slider.dart';

class ProductDetailsPage extends StatelessWidget {
  final storeController = Get.find<StoreController>();
  final cartKey = GetStorage().read('cartKey');
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
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ImageSlider(
                                  cartItemsCount:
                                      storeController.cartData!.itemCount,
                                  img: Get.arguments['0'].images![0].imgUrl
                                      .toString(),
                                ),
                                ProductsInfo(
                                  title:
                                      Get.arguments['0'].productName.toString(),
                                  discription:
                                      Get.arguments['0'].description.toString(),
                                  isFav: storeController.ifFavorite(
                                      Get.arguments['0'].id!.toInt()),
                                  onTapFav: () {
                                    print('hvh');
                                    storeController.manageFavorite(
                                        productId:
                                            Get.arguments['0'].id!.toInt(),
                                        productList: Get.arguments['1']);
                                  },
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
                        price: '${Get.arguments['0'].price.toString()} ل.س',
                        ontab: () async {
                          storeController.showCircleCartIndicator();
                          await storeController.addToCart(
                              cartKey: cartKey,
                              productId: Get.arguments['0'].id.toString(),
                              quantity: '1');
                        },
                      ),
                    ],
                  ),
                  storeController.isCircleCartShown
                      ? const CircleIndicatorScreen()
                      : Container()
                ],
              );
            })),
      ),
    );
  }
}
