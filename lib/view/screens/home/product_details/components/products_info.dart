import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ProductsInfo extends StatefulWidget {
  final String title;
  final String discription;
  const ProductsInfo({required this.title, required this.discription, Key? key})
      : super(key: key);

  @override
  State<ProductsInfo> createState() => _ProductsInfoState();
}

class _ProductsInfoState extends State<ProductsInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextWidget(
                  text: widget.title,
                  color: blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  maxline: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: 20.sp,
                        height: 20.sp,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/heart_red.png')),
                        ))),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextWidget(
            text: 'الوصف',
            color: primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
            maxline: 1,
          ),
          ReadMoreText(
            widget.discription,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            lessStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            moreStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
