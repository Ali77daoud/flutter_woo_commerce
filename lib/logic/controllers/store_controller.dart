import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/auth_controller.dart';
import 'package:flutter_woocommerce/model/store_models.dart/cart/cart_model.dart';
import 'package:flutter_woocommerce/model/store_models.dart/products_model.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/services/network/store_network.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/utils/strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/store_models.dart/categories_model.dart';

class StoreController extends GetxController {
  bool noInternetConnectionProducts = false;
  bool noInternetConnectionCart = false;
  bool isCircleProductsShown = false;
  bool isCircleCartShown = false;
  bool isPageReloading = false;

  List<ProductsModel> favoritesList = [];
  var isFavorites = false;
  var favoriteStorage = GetStorage();

  String? cartKey;

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

  final authController = Get.put(AuthController());
  @override
  void onInit() async {
    super.onInit();
    //////////////////// for favourite
    final storedShopping = GetStorage().read<String>('favorite');
    // String? storedShopping = GetStorage.read<String>('favorite');
    if (storedShopping != null) {
      print('list not null');
      List decodeJsonData = json.decode(storedShopping);
      favoritesList =
          decodeJsonData.map((e) => ProductsModel.fromJson(e)).toList();
    } else {
      print('list  null');
    }
    ////////////////////////
    cartKey = authController.cartKeyBox.read<String>('cartKey') ?? '';
    print(cartKey);
    await getHomePageData(cartKey: cartKey.toString()).then((value) {
      if (!authController.cartKeyBox.hasData('cartKey')) {
        print('cartKeyBox does not has data');
        cartKey = cartData!.cartKey.toString();
        authController.cartKeyBox.write('cartKey', cartKey);
      }
    });
  }

//////////////////////////////////////////////////////

  Future<void> getHomePageData({required String cartKey}) async {
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
            await getCart(cartKey: cartKey);
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

  Future<void> getCart({required String cartKey}) async {
    await StoreApi.getCart(cartKey: cartKey).then((value) {
      cartData = value;
    });

    print(cartData!.cartHash.toString());
  }

  // add to cart

  Future<void> addToCart(
      {required String productId,
      required String quantity,
      required String cartKey}) async {
    try {
      await StoreApi.addToCart(
              productId: productId, quantity: quantity, cartKey: cartKey)
          .then((value) {
        cartData = value;
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
  Future<void> clearItemFromCart(
      {required String itemKey, required String cartKey}) async {
    try {
      await StoreApi.clearFromCart(itemKey: itemKey, cartKey: cartKey)
          .then((value) {
        cartData = value;
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

  // favorite

  void manageFavorite(
      {required int productId,
      required List<ProductsModel> productList}) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    //when the the product is not in the list it returns -1
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      // encode for getStorage
      var favToJson = favoritesList.map((e) => e.productModeltoJson()).toList();
      String encodedFav = json.encode(favToJson);
      print(encodedFav);
      ///////////////////
      await favoriteStorage
          .write('favorite', encodedFav)
          .then((value) => print('write'));
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
      // encode for getStorage
      var favToJson = favoritesList.map((e) => e.productModeltoJson()).toList();
      String encodedFav = json.encode(favToJson);
      print(encodedFav);
      ////////////
      await favoriteStorage.write('favorite', encodedFav).then((value) {
        print('write');
      });
    }
    update();
  }

  void removeProduct(int productId) async {
    var index = favoritesList.indexWhere((element) => element.id == productId);
    favoritesList.removeAt(index);
    // encode for getStorage
    var favToJson = favoritesList.map((e) => e.productModeltoJson()).toList();
    String encodedFav = json.encode(favToJson);
    ////////////
    await favoriteStorage.write('favorite', encodedFav);
    update();
  }

  bool ifFavorite(int productid) {
    return favoritesList.any((element) => element.id == productid);
  }
}
