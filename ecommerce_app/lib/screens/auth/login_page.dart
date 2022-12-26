import 'dart:convert';

import 'package:ecommerce_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ecommerce_app/const/api_link.dart';
import 'package:ecommerce_app/const/show_toast.dart';
import 'package:ecommerce_app/const/style.dart';
import 'package:ecommerce_app/screens/nav_bar/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isObsecure = false;

  getLoginData() async {
    try {
      setState(() {
        isLoading = true;
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String link = "${baseUrl}sign-in";
      var map = Map<String, dynamic>();
      map["email"] = _emailController.text.toString();
      map["password"] = _passwordController.text.toString();
      var responce = await http.post(Uri.parse(link), body: map);
      var data = jsonDecode(responce.body);
      setState(() {
        isLoading = false;
      });
      print("access token is ${data["access_token"]}");
      if (data["access_token"] != null) {
        sharedPreferences.setString("token", data["access_token"]);
        print("saved token is ${sharedPreferences.getString("token")}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNavBarPage()),
            (route) => false);
        showToastMessage("Login Successfully");
      } else {
        showToastMessage("Email or Password doesn't match");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70.r),
                            bottomLeft: Radius.circular(70.r)),
                        color: Color(0xff000080).withOpacity(0.7)),
                    child: Lottie.asset("assets/login.json",
                        height: 50.h, repeat: true, reverse: true),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Sign In",
                    style: myStyle(25.sp, Color(0xff008000), FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Please login to your account",
                    style: myStyle(16.sp, Colors.black54, FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Enter Your Email",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(
                          isObsecure == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                          size: 18.sp,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Enter Your Password",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: myStyle(18.sp, Colors.blue.withOpacity(0.8),
                              FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      //showToastMessage("Please required filed!");
                      getLoginData();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(
                        "Sign In",
                        style: myStyle(20.sp, Colors.white, FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: myStyle(16.sp, Colors.black54, FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Sign Up",
                          style: myStyle(18.sp, Colors.blue.withOpacity(0.8),
                              FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
