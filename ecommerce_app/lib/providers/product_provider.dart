import 'package:ecommerce_app/custom_http/custom_http.dart';
import 'package:ecommerce_app/model_class/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];

  getProductData() async {
    productList = await CustomHttpRequest.fetchAllProduct();
    notifyListeners();
  }
}
