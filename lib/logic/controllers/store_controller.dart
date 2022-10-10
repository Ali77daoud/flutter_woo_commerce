import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/model/store_models.dart/cart/cart_model.dart';
import 'package:flutter_woocommerce/model/store_models.dart/products_model.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/services/network/store_network.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/strings.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/store_models.dart/categories_model.dart';
import 'auth_controller.dart';

class StoreController extends GetxController {
  bool noInternetConnectionProducts = false;
  bool noInternetConnectionCart = false;
  bool isCircleProductsShown = false;
  bool isCircleCartShown = false;
  bool isPageReloading = false;
  // bool isEmptyCart = true;
///////////////////////////////////////////////////
  void showNoInternetPageProducts() {
    noInternetConnectionProducts = true;
    update();
  }

  void hideNoInternetPageProducts() {
    noInternetConnectionProducts = false;
    update();
  }

///////////////////////////////////////////////////
  void showIsPageReloading() {
    isPageReloading = true;
    update();
  }

  void hideIsPageReloading() {
    isPageReloading = false;
    update();
  }

/////////////////////////////////////////////////////
  void showCircleProductsIndicator() {
    isCircleProductsShown = true;
    update();
  }

  void hideCircleProductsIndicator() {
    isCircleProductsShown = false;
    update();
  }

/////////////////////////////////////////////////////
  void showCircleCartIndicator() {
    isCircleCartShown = true;
    update();
  }

  void hideCircleCartIndicator() {
    isCircleCartShown = false;
    update();
  }

/////////////////////////////////////////////////////
  // void showEmptyCartPage() {
  //   isEmptyCart = true;
  //   update();
  // }

  // void hideEmptyCartPage() {
  //   isEmptyCart = false;
  //   update();
  // }

///////////////////////////////////////////////////
  final authController = Get.put(AuthController());
  @override
  void onInit() async {
    super.onInit();
    String? token = authController.tokenBox.read<String>('token');
    print(token);
    await getHomePageData(token: token.toString());
  }

//////////////////////////////////////////////////////

  Future<void> getHomePageData({required String token}) async {
    showCircleProductsIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      final timer = Timer(const Duration(seconds: 25), () {
        print('timer active');
        showNoInternetPageProducts();
      });
      await getCategories().then((value) async {
        await getProducts().then(
          (value) async {
            await getCart(token: token);
          },
        ).then((value) {
          hideCircleProductsIndicator();
          timer.cancel();
          print('stop timer');
        });
      });
    } else {
      print('no connection');
      showNoInternetPageProducts();
    }
    update();
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<void> getProductPageData({required int catId}) async {
    showCircleProductsIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      final timer = Timer(const Duration(seconds: 28), () {
        print('timer active');
        showNoInternetPageProducts();
      });
      await getProductsByCategoryId(catId: catId).then((value) async {
        Get.toNamed(Routes.productPage);
        hideCircleProductsIndicator();
        timer.cancel();
        print('stop timer');
      });
    } else {
      print('no connection');
      showNoInternetPageProducts();
    }
    update();
  }
/////////////////////////////////////////////////////////////////////////////////////////

  // categories
  List<CategoriesModel>? categoriesData;

  Future<void> getCategories() async {
    categoriesData = await StoreApi.getCategories();
  }

  // products

  List<ProductsModel>? productsLatestData;
  List<ProductsModel>? productsMostSellingData;
  List<ProductsModel>? productsCategoryData;

  Future<void> getProducts() async {
    productsLatestData =
        await StoreApi.getProducts(tagId: latestProductsTag, category: '');
    productsMostSellingData =
        await StoreApi.getProducts(tagId: mostSellingTag, category: '');
  }

  Future<void> getProductsByCategoryId({required int catId}) async {
    productsCategoryData =
        await StoreApi.getProducts(tagId: '', category: catId.toString());
    print(productsCategoryData![0].id);
  }

  //////////////////////////////////////////////////////////////////////////////

  // cart

  CartModel? cartData;

  Future<void> getCart({required String token}) async {
    cartData = await StoreApi.getCart(token: token);
    print(cartData!.cartKey.toString());
    print(cartData!.cartHash.toString());
    // showCircleCartIndicator();
    // var result = await InternetConnectionChecker().hasConnection;

    // if (result) {
    //   print('connection');
    //   Timer(const Duration(seconds: 25), () {
    //     print('timer');
    //     if (isCircleProductsShown == true) {
    //       showNoInternetPageCart();
    //     }
    //   });
    //   await StoreApi.getCart().then((value) {
    //     cartData = value;
    //     hideCircleCartIndicator();
    //     if (value.itemCount == 0) {
    //       showEmptyCartPage();
    //     } else {
    //       hideEmptyCartPage();
    //     }
    //   });
    // } else {
    //   print('no connection');
    //   showNoInternetPageCart();
    // }
    // update();
  }

  // add to cart

  Future<void> addToCart(
      {required String productId,
      required String quantity,
      required String token}) async {
    try {
      await StoreApi.addToCart(
              productId: productId, quantity: quantity, token: token)
          .then((value) {
        cartData = value;
        Get.snackbar('تمت إضافة المنتج للسلة', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: whiteColor,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(0),
            borderRadius: 0);
        hideCircleCartIndicator();
      });
    } catch (e) {
      print(e.toString());
      hideCircleCartIndicator();
      Get.snackbar('حدث خطأ أثناء إضافة المنتج للسلة', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: whiteColor,
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
          duration: const Duration(seconds: 3));
    }
  }

  // clear item from cart
  Future<void> clearItemFromCart({required String itemKey}) async {
    try {
      await StoreApi.clearFromCart(itemKey: itemKey).then((value) {
        cartData = value;
        Get.snackbar('تم حذف المنتج بنجاح', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: primaryColor,
            colorText: whiteColor,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(0),
            borderRadius: 0);
        hideCircleCartIndicator();
      });
    } catch (e) {
      print(e.toString());
      hideCircleCartIndicator();
      Get.snackbar('حدث خطأ أثناء حذف المنتج ', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: whiteColor,
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
          duration: const Duration(seconds: 3));
    }
  }
}
