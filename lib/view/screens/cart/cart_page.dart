import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/screens/favourite/favouritewidgets/favorite_card.dart';
import 'package:sizer/sizer.dart';
import '../../widget/buy_widget.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: primaryColor,
            child: ListView.separated(
              itemBuilder: (context, index) => FavouriteCard(
                ifNetworkImage: false,
                img: 'assets/images/shirt2.jpg',
                title: 'قميص',
                underText: '25000 ل.س',
                textcolor: Colors.black,
                firstIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        // cartcontroller.removeProductFromCart(
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
                          Icons.exposure_minus_1,
                          color: Colors.white,
                          size: 10.sp,
                        ),
                      ),
                    ),
                    Text('1', style: TextStyle(fontSize: 10.sp)),
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
                secondIcon: Container(
                    width: 20.sp,
                    height: 20.sp,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/trash_icon.png')),
                    )),
                flex: 3,
              ),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: 5,
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
    );
  }
}
