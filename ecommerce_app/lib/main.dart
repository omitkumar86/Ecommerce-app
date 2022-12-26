import 'package:ecommerce_app/providers/category_provider.dart';
import 'package:ecommerce_app/providers/order_provider.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:ecommerce_app/providers/profile_provider.dart';
import 'package:ecommerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider()),
            ChangeNotifierProvider(create: (context) => CategoryProvider()),
            ChangeNotifierProvider(create: (context) => OrderProvider()),
            ChangeNotifierProvider(create: (context) => ProfileProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              //scaffoldBackgroundColor: Color(0xffF5F5F5).withOpacity(0.6),
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),

            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
