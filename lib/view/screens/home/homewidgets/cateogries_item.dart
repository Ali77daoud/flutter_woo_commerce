import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/products_controller.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';

class CategoriesItems extends StatelessWidget {
  CategoriesItems({Key? key}) : super(key: key);

  final productController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextWidget(
              text: 'كل الأقسام',
              color: blackColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              maxline: 1),
        ),
        SizedBox(
          height: 130,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.left,
            color: primaryColor,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: productController.categoriesData!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Get.toNamed(Routes.productPage);
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                            image: productController
                                        .categoriesData![index].image ==
                                    null
                                ? DecorationImage(
                                    image: AssetImage(
                                      'assets/images/shirt2.jpg'.toString(),
                                    ),
                                    fit: BoxFit.contain)
                                : DecorationImage(
                                    image: NetworkImage(
                                      productController
                                          .categoriesData![index].image!.imgUrl
                                          .toString(),
                                    ),
                                    fit: BoxFit.contain),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 5),
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 10),
                            ]),
                        // child: productController.categoriesData[index].image ==
                        //         null
                        //     ? Image.asset(
                        //         'assets/images/shirt2.jpg'.toString(),
                        //         fit: BoxFit.contain,
                        //         height: 40,
                        //       )
                        //     : Image.network(
                        //         productController
                        //             .categoriesData[index].image!.imgUrl
                        //             .toString(),
                        //         fit: BoxFit.contain,
                        //         height: 40,
                        //       ),
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: productController
                                  .categoriesData![index].categoryName
                                  .toString(),
                              color: blackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.center,
                              maxline: 2),
                          const Icon(
                            Icons.keyboard_arrow_left,
                            size: 14,
                          )
                        ],
                      )
                    ],
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
