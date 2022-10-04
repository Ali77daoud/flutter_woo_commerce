import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';

import 'favouritewidgets/favorite_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: primaryColor,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return FavouriteCard(
              ifNetworkImage: false,
              firstIcon: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/heart_red.png')),
                  )),
              img: 'assets/images/shirt2.jpg',
              underText: '25000 ل.س',
              textcolor: Colors.black,
              title: 'قميص',
              secondIcon: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/shopping_icon.png')),
                  )),
              flex: 1,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 3),
    );
  }
}
