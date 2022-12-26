import 'package:ecommerce_app/custom_http/custom_http.dart';
import 'package:ecommerce_app/model_class/profile_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  List<ProfileModel> profileList = [];

  getProfileData() async {
    profileList = await CustomHttpRequest.fetchProfileData();
    notifyListeners();
  }
}
