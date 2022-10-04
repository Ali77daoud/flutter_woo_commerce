import 'dart:convert';

import 'package:flutter_woocommerce/model/store_models.dart/categories_model.dart';
import 'package:flutter_woocommerce/model/store_models.dart/products_model.dart';
import 'package:flutter_woocommerce/utils/strings.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  // get categories
  static Future<List<CategoriesModel>> getCategories() async {
    late List<CategoriesModel> categoryData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/wc/v3/products/categories?consumer_key=$consumerKey&consumer_secret=$consumerSecret');

    var response = await client.get(
      uri,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get categories success');

        categoryData = (responseData as List)
            .map((e) => CategoriesModel.fromJson(e))
            .toList();

        return categoryData;
      } else {
        print('categories data null');
        return throw Exception('Categories Data Null');
      }
    } else {
      print('get categories field');
      throw Exception('Get Categories Field');
    }
  }

  // get products
  static Future<List<ProductsModel>> getProducts(
      {required String tagId}) async {
    late List<ProductsModel> productData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/wc/v3/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&tag=$tagId');
    // /wp-json/wc/v3/products?consumer_key=ck_2a82d3fd6fca9458a05290afaed1323a7f4fbd1b&consumer_secret=cs_fff60d5fa674ea98e5c4ac0280469b7fcf6fd61a&tag=');

    var response = await client.get(
      uri,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get products success');

        productData = (responseData as List)
            .map((e) => ProductsModel.fromJson(e))
            .toList();

        return productData;
      } else {
        print('products data null');
        return throw Exception('Products Data Null');
      }
    } else {
      print('get products field');
      throw Exception('Get Products Field');
    }
  }
}
