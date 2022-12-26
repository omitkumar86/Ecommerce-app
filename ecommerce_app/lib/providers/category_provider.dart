import 'package:ecommerce_app/custom_http/custom_http.dart';
import 'package:ecommerce_app/model_class/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  getCategoryData() async {
    categoryList = await CustomHttpRequest.fetchAllCategoryData();
    notifyListeners();
  }
}
