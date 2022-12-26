import 'package:ecommerce_app/const/style.dart';
import 'package:ecommerce_app/screens/nav_bar/category_page.dart';
import 'package:ecommerce_app/screens/nav_bar/order_page.dart';
import 'package:ecommerce_app/screens/nav_bar/product_page.dart';
import 'package:ecommerce_app/screens/nav_bar/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;
  bool isselectedItemColor = false;
  static const List<Widget> _widgetOptions = <Widget>[
    OrderPage(),
    CategoryPage(),
    ProductPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'My Order',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify_outlined),
            label: 'Product',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        selectedFontSize: 16.0,
        unselectedFontSize: 16.0,
        elevation: 10,
        onTap: _onItemTapped,
      ),
    );
  }
}
