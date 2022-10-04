import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopSlider extends StatefulWidget {
  const TopSlider({Key? key}) : super(key: key);

  @override
  _TopSliderState createState() => _TopSliderState();
}

class _TopSliderState extends State<TopSlider> {
  final imageList = [
    'assets/images/slider.jpg',
    'assets/images/slider2.png',
    'assets/images/slider3.jpg'
  ];
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // var catImage = CircleAvatar(child: Image.asset(),);
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
              initialPage: currentPage,
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      image: AssetImage(imageList[index]), fit: BoxFit.contain),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.black.withOpacity(0.5),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentPage,
                  count: 3,
                  effect: SlideEffect(
                    dotColor: whiteColor,
                    activeDotColor: primaryColor,
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 5,
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
