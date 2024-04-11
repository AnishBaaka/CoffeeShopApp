import 'package:coffeeshopapp/components/bottom_nav_bar.dart';
import 'package:coffeeshopapp/const.dart';
import 'package:coffeeshopapp/pages/cart_page.dart';
import 'package:coffeeshopapp/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//navigate bottom bar
  int _selectedIndex = 0;
  void navigateButtomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateButtomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
