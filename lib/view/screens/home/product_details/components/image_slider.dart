import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/mainscreen_controller.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String img;
  final int cartItemsCount;
  const ImageSlider({required this.img, required this.cartItemsCount, Key? key})
      : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  int currentPage = 0;

  final mainScreenController = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          /////////1
          CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.img), fit: BoxFit.contain),
                ),
              );
            },
          ),
          /////////////2
          Positioned(
            bottom: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  color: Colors.black.withOpacity(0.3),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentPage,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: primaryColor,
                    dotColor: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          //////////////3
          Container(
            padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                // Badge(
                //   position: BadgePosition.topEnd(top: -10, end: -10),
                //   animationDuration: const Duration(milliseconds: 300),
                //   animationType: BadgeAnimationType.slide,
                //   badgeContent: Text(
                //     '${cartcontroller.totalCartProducts}',
                //     style: const TextStyle(color: Colors.white),
                //   ),
                //   child:
                Badge(
                  toAnimate: true,
                  animationType: BadgeAnimationType.scale,
                  shape: BadgeShape.circle,
                  badgeColor: primaryColor,
                  badgeContent: Text(widget.cartItemsCount.toString(),
                      style: TextStyle(color: Colors.white)),
                  child: InkWell(
                    onTap: () {
                      mainScreenController.changeIndex(1);
                      Get.back();
                      Get.back();
                      Get.toNamed(Routes.mainScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          width: 20.sp,
                          height: 20.sp,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/shopping_white.png')),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
