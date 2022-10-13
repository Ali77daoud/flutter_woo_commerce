import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/store_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../widget/card_widget.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: primaryColor,
        child: GetBuilder<StoreController>(builder: (_) {
          return storeController.favoritesList.isEmpty
              ? Column(
                  children: [
                    Container(
                      color: Colors.red,
                      width: 100,
                      height: 200,
                    )
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return CardWidget(
                      ifNetworkImage: true,
                      firstIcon: InkWell(
                        onTap: () {
                          // final fav = GetStorage().read<String>('favorite');
                          // print(fav.toString());
                          storeController.removeProduct(
                              storeController.favoritesList[index].id!.toInt());
                        },
                        child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/heart_filled.png')),
                            )),
                      ),
                      img:
                          // '',
                          storeController.favoritesList[index].images![0].imgUrl
                              .toString(),
                      underText:
                          '${storeController.favoritesList[index].price.toString()} ل.س',
                      textcolor: Colors.black,
                      title: storeController.favoritesList[index].productName
                          .toString(),
                      secondIcon: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/shopping_icon.png')),
                          )),
                      flex: 1,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: storeController.favoritesList.length);
        }));
  }
}
