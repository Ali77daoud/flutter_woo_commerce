import 'dart:async';

import 'package:flutter_woocommerce/model/store_models.dart/products_model.dart';
import 'package:flutter_woocommerce/routes/routes.dart';
import 'package:flutter_woocommerce/services/network/store_network.dart';
import 'package:flutter_woocommerce/utils/strings.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/store_models.dart/categories_model.dart';

class StoreController extends GetxController {
  bool isCircleShown = false;
  bool noInternetConnection = false;

  void showNoInternetPage() {
    noInternetConnection = true;
    update();
  }

  void hideNoInternetPage() {
    noInternetConnection = false;
    update();
  }

  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    await getHomePageData();
  }

//////////////////////////////////////////////////////

  Future<void> getHomePageData() async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      Timer(const Duration(seconds: 25), () {
        print('timer');
        if (isCircleShown == true) {
          showNoInternetPage();
        }
        // hideCircleIndicator();
      });
      await getCategories().then((value) async {
        await getProducts().then(
          (value) {
            hideCircleIndicator();
          },
        );
      });
    } else {
      print('no connection');
      showNoInternetPage();
    }
    update();
  }
/////////////////////////////////////////////////////

  // categories
  List<CategoriesModel>? categoriesData;

  Future<void> getCategories() async {
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      categoriesData = await StoreApi.getCategories();
    } else {
      throw Exception('No Connection');
    }
  }

  // products

  // late List<ProductsModel> productsData;
  List<ProductsModel>? productsLatestData;
  List<ProductsModel>? productsMostSellingData;

  Future<void> getProducts() async {
    // productsData = await StoreApi.getProducts(tagId: '');
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      productsLatestData = await StoreApi.getProducts(tagId: latestProductsTag);
      productsMostSellingData =
          await StoreApi.getProducts(tagId: mostSellingTag);
    } else {
      throw Exception('No Connection');
    }
  }
}
