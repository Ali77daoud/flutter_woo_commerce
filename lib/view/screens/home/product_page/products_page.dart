import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/circle_indicator_screen.dart';
import 'package:flutter_woocommerce/view/screens/home/product_page/components/product_widget.dart';
import 'package:flutter_woocommerce/view/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final TextEditingController searchkey = TextEditingController();

  final String dropdownvalue = 'Item 1';
  final storeController = Get.find<StoreController>();
  final cartKey = GetStorage().read('cartKey');
  // List of items in our dropdown menu
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
            appBar: customAppBar(fontSize: 25, text: 'تسوّق'),
            body: GetBuilder<StoreController>(builder: (_) {
              return Stack(
                children: [
                  GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            /// top section //////////////////////////////////////////////////////////////////
                            SizedBox(
                              height: 35,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: searchkey,
                                      keyboardType: TextInputType.text,
                                      cursorColor: blackColor,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(3),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 216, 216, 216),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Color.fromARGB(
                                              255, 122, 122, 122),
                                        ),
                                        hintText: 'إبحث عن منتج',
                                        hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 122, 122, 122)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  ///////////////////////////////
                                  PopupMenuButton(
                                    icon: Icon(
                                      Icons.sort,
                                      size: 23.sp,
                                      color: const Color.fromARGB(
                                          255, 122, 122, 122),
                                    ),
                                    onSelected: (value) {
                                      if (value == 1) {
                                        print('111');
                                      }
                                      if (value == 2) {
                                        print('222');
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                          value: 1, child: Text('أقل سعر')),
                                      const PopupMenuItem(
                                          value: 2, child: Text('أكبر سعر')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ////////////////////////////////////////////////////////////////////////////////////////////
                            const SizedBox(
                              height: 50,
                            ),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 18,
                                  childAspectRatio: 0.75,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: storeController
                                    .productsCategoryData!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      Get.toNamed(Routes.productDetailsPage,
                                          arguments: {
                                            "0": storeController
                                                .productsCategoryData![index],
                                            "1": storeController
                                                .productsCategoryData,
                                          });
                                    },
                                    child: ProductWidget(
                                      onTapCart: () async {
                                        storeController
                                            .showCircleCartIndicator();
                                        await storeController.addToCart(
                                            cartKey: cartKey,
                                            productId: storeController
                                                .productsCategoryData![index].id
                                                .toString(),
                                            quantity: '1');
                                      },
                                      isFav: storeController.ifFavorite(
                                          storeController
                                              .productsCategoryData![index].id!
                                              .toInt()),
                                      onTapHeart: () {
                                        storeController.manageFavorite(
                                            productId: storeController
                                                .productsCategoryData![index]
                                                .id!
                                                .toInt(),
                                            productList: storeController
                                                .productsCategoryData!);
                                      },
                                      isNetworkImg: true,
                                      img: storeController
                                          .productsCategoryData![index]
                                          .images![0]
                                          .imgUrl
                                          .toString(),
                                      productName: storeController
                                          .productsCategoryData![index]
                                          .productName
                                          .toString(),
                                      productPrice:
                                          '${storeController.productsCategoryData![index].price}',
                                      iconsPadding: 20,
                                      productNameSize: 10.sp,
                                      productPriceSize: 10.sp,
                                    ),
                                  );
                                }),
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
            })),
      ),
    );
  }
}
