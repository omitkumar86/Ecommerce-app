import 'dart:async';

import 'package:ecommerce_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ecommerce_app/const/style.dart';
import 'package:ecommerce_app/screens/auth/login_page.dart';
import 'package:ecommerce_app/screens/nav_bar/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavBarPage()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }
  }

  @override
  void initState() {
    isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff293B4F),
      body: Center(
        child: showProgressIndicator(),
      ),
    );
  }
}
