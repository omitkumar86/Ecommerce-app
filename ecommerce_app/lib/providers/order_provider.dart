import 'package:ecommerce_app/custom_http/custom_http.dart';
import 'package:ecommerce_app/model_class/order_model.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];

  getAllOrderData() async {
    orderList = await CustomHttpRequest.fetchAllOrderData();
    notifyListeners();
  }
}
