import 'dart:convert';

import 'package:ecommerce_app/const/api_link.dart';
import 'package:ecommerce_app/model_class/category_model.dart';
import 'package:ecommerce_app/model_class/order_model.dart';
import 'package:ecommerce_app/model_class/product_model.dart';
import 'package:ecommerce_app/model_class/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest {
  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}"
    };
    print("Saved token is ${sharedPreferences.getString("token")}");
    return header;
  }

  static Future<List<ProductModel>> fetchAllProduct() async {
    List<ProductModel> productList = [];
    ProductModel productModel;
    String urlLink = "${baseUrl}products";
    var responce = await http.get(Uri.parse(urlLink),
        headers: await CustomHttpRequest.getHeaderWithToken());
    print("aaaaaaaaaaaaaaaaaa ${responce.body}");
    var data = jsonDecode(responce.body);
    for (Map<String, dynamic> i in data) {
      productModel = ProductModel.fromJson(i);
      productList.add(productModel);
    }
    return productList;
  }

  static Future<List<OrderModel>> fetchAllOrderData() async {
    List<OrderModel> orderList = [];
    OrderModel orderModel;
    String urlLink = "${baseUrl}all/orders";
    var responce = await http.get(Uri.parse(urlLink),
        headers: await CustomHttpRequest.getHeaderWithToken());
    var data = jsonDecode(responce.body);
    print("aaaaaaaaaaaaaaaaaa ${responce.body}");
    for (Map<String, dynamic> i in data) {
      orderModel = OrderModel.fromJson(i);
      orderList.add(orderModel);
    }
    return orderList;
  }

  static Future<List<CategoryModel>> fetchAllCategoryData() async {
    List<CategoryModel> categoryList = [];
    CategoryModel categoryModel;
    String urlLink = "${baseUrl}category";
    var responce = await http.get(
      Uri.parse(urlLink),
      headers: await CustomHttpRequest.getHeaderWithToken(),
    );
    var data = jsonDecode(responce.body.toString());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb ${responce.body}");
    for (Map<String, dynamic> i in data) {
      categoryModel = CategoryModel.fromJson(i);
      categoryList.add(categoryModel);
    }
    return categoryList;
  }

  static Future<List<ProfileModel>> fetchProfileData() async {
    List<ProfileModel> profileList = [];
    ProfileModel profileModel;
    String urlLink = "${baseUrl}profile";
    var responce = await http.get(
      Uri.parse(urlLink),
      headers: await CustomHttpRequest.getHeaderWithToken(),
    );
    var data = jsonDecode(responce.body.toString());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb ${responce.body}");
    for (Map<String, dynamic> i in data) {
      profileModel = ProfileModel.fromJson(i);
      profileList.add(profileModel);
    }
    print("Name is -----------------${profileList[0].name}");
    return profileList;
  }
}
