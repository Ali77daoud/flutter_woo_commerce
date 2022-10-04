import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class ProductWidget extends StatelessWidget {
  final String img;
  final String productName;
  final double productNameSize;
  final String productPrice;
  final double productPriceSize;
  final double iconsPadding;
  final bool isNetworkImg;
  const ProductWidget(
      {Key? key,
      required this.img,
      required this.productName,
      required this.productPrice,
      required this.iconsPadding,
      required this.productNameSize,
      required this.productPriceSize,
      required this.isNetworkImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: iconsPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 20.sp,
                    height: 20.sp,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/shopping_icon.png')),
                    )),
                Container(
                    width: 20.sp,
                    height: 20.sp,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/heart_red.png')),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(-5, 5),
                      blurStyle: BlurStyle.normal,
                      blurRadius: 5),
                ]),
            child: isNetworkImg
                ? Image.network(
                    img,
                    fit: BoxFit.contain,
                    width: 110,
                  )
                : Image.asset(
                    'assets/images/shirt2.jpg',
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5 / 4),
          child: TextWidget(
            text: productName,
            color: blackColor,
            fontSize: productNameSize,
            // 10.sp,
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.center,
            maxline: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextWidget(
          text: '$productPrice ل.س',
          color: primaryColor,
          fontSize: productPriceSize,
          // 10.sp,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          maxline: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
