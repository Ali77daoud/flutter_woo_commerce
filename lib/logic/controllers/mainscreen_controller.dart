import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/view/screens/cart/cart_page.dart';
import 'package:flutter_woocommerce/view/screens/favourite/favorite_page.dart';
import 'package:flutter_woocommerce/view/screens/home/home_page.dart';
import 'package:flutter_woocommerce/view/screens/profile/profile_page.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  int i = 0;
  bool isGetProducts = false;
  bool isGetCart = true;

  void changeIndex(int index) {
    i = index;
    update();
  }

  List<Widget> screens = [
    HomePage(),
    CartPage(),
    const FavoritePage(),
    ProfilePage()
  ];

  List<String> titles = ['تسوّق', 'السّلّة', 'الإعجابات', 'الملف الشّخصي'];
}
