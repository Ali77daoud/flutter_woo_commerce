import 'dart:convert';

import 'package:flutter_woocommerce/model/store_models.dart/cart/cart_model.dart';
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

    var response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

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
      {required String tagId, required String category}) async {
    late List<ProductsModel> productData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/wc/v3/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&tag=$tagId&category=$category');
    // /wp-json/wc/v3/products?consumer_key=ck_2a82d3fd6fca9458a05290afaed1323a7f4fbd1b&consumer_secret=cs_fff60d5fa674ea98e5c4ac0280469b7fcf6fd61a&tag=');

    var response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

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

  ///////////////////////////////////////////////////////////
  ///get cart

  static Future<CartModel> getCart({required String token}) async {
    late CartModel cartData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/cocart/v2/cart?cart_key=d2312e9997cf4b305203e93c27d1ea75');

    var response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get cart success');

        cartData = CartModel.fromJson(responseData);

        return cartData;
      } else {
        print('cart data null');
        return throw Exception('Cart Data Null');
      }
    } else {
      print('get cart field');
      throw Exception('Get Cart Field');
    }
  }

  ///clear cart

  static Future<CartModel> clearCart({required String token}) async {
    late CartModel cartData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/cocart/v2/cart/clear?cart_key=d2312e9997cf4b305203e93c27d1ea75');

    var response = await client.post(uri, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('clear cart success');

      var responseData = json.decode(response.body);

      if (responseData != null) {
        cartData = CartModel.fromJson(responseData);
        print('get cart success');
        return cartData;
      } else {
        print('cart data null');
        return throw Exception('Cart Data Null');
      }
    } else {
      print('clear cart field');
      throw Exception('Clear Cart Field');
    }
  }

  // add to cart

  static Future<CartModel> addToCart(
      {required String token,
      required String productId,
      required String quantity}) async {
    late CartModel cartData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/cocart/v2/cart/add-item?cart_key=d2312e9997cf4b305203e93c27d1ea75');

    var response = await client.post(uri, headers: {
      // 'Authorization': 'Bearer $token',
    }, body: {
      "id": productId,
      "quantity": quantity
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('add to cart success');

      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get cart success');
        print(responseData['item_count']);
        cartData = CartModel.fromJson(responseData);

        return cartData;
      } else {
        print('cart data null');
        return throw Exception('Cart Data Null');
      }
    } else {
      print('add to cart field');
      throw Exception('Add to Cart Field');
    }
  }

  // clear item from cart

  static Future<CartModel> clearFromCart({required String itemKey}) async {
    late CartModel cartData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/cocart/v2/cart/item/$itemKey?cart_key=d2312e9997cf4b305203e93c27d1ea75');

    var response = await client.delete(
      uri,
      headers: {
        // 'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('clear item from cart success');

      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get cart success');

        cartData = CartModel.fromJson(responseData);

        return cartData;
      } else {
        print('cart data null');
        return throw Exception('Cart Data Null');
      }
    } else {
      print('clear item from cart field');
      throw Exception('Clear Item From Cart Field');
    }
  }

  // update item

  static Future<CartModel> updateInCart(
      {required String token,
      required String itemKey,
      required String quantity}) async {
    late CartModel cartData;

    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/cocart/v2/cart/item/$itemKey?cart_key=d2312e9997cf4b305203e93c27d1ea75');

    var response = await client.post(uri, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    }, body: {
      "quantity": quantity
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('update cart success');

      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get cart success');

        cartData = CartModel.fromJson(responseData);

        return cartData;
      } else {
        print('cart data null');
        return throw Exception('Cart Data Null');
      }
    } else {
      print('update cart field');
      throw Exception('Update Cart Field');
    }
  }
}
