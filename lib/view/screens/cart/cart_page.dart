import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/mainscreen_controller.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/circle_indicator_screen.dart';
import 'package:flutter_woocommerce/view/screens/cart/component/empty_cart_screen.dart';
import 'package:flutter_woocommerce/view/widget/card_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widget/buy_widget.dart';
import '../../widget/card_widget.dart';

class CartPage extends StatelessWidget {
  final storeController = Get.put(StoreController());

  CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (_) {
      return storeController.cartData!.itemCount == 0
          ? EmptyCartPage()
          : Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: primaryColor,
                        child: ListView.separated(
                          itemBuilder: (context, index) => CardWidget(
                            ifNetworkImage: true,
                            img: storeController
                                .cartData!.items[index].featuredImage
                                .toString(),
                            title: storeController.cartData!.items[index].name,
                            underText:
                                '${storeController.cartData!.items[index].price} ل.س',
                            textcolor: Colors.black,
                            firstIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 15.sp,
                                    height: 15.sp,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.exposure_minus_1,
                                      color: Colors.white,
                                      size: 10.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                    storeController
                                        .cartData!.items[index].quantity.value
                                        .toString(),
                                    style: TextStyle(fontSize: 10.sp)),
                                InkWell(
                                  onTap: () {
                                    // cartcontroller.addProductToCart(
                                    //     cartcontroller.productsMap.keys.toList()[index]);
                                  },
                                  child: Container(
                                    width: 15.sp,
                                    height: 15.sp,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.plus_one,
                                      color: Colors.white,
                                      size: 10.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            secondIcon: InkWell(
                              onTap: () async {
                                // print(storeController
                                //     .cartData!.items[index].itemKey);
                                storeController.showCircleCartIndicator();

                                await storeController.clearItemFromCart(
                                    itemKey: storeController
                                        .cartData!.items[index].itemKey
                                        .toString());
                              },
                              child: Container(
                                  width: 20.sp,
                                  height: 20.sp,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/trash_icon.png')),
                                  )),
                            ),
                            flex: 3,
                          ),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: storeController.cartData!.items.length,
                        ),
                      ),
                    ),
                    BuyWidget(
                      firstText: 'المجموع النهائي',
                      buttonText: 'شراء',
                      price: '20000 ل.س',
                      ontab: () {
                        print(MediaQuery.of(context).size.width);
                      },
                    ),
                  ],
                ),
                storeController.isCircleCartShown
                    ? const CircleIndicatorScreen()
                    : Container(),
              ],
            );
    });
  }
}
