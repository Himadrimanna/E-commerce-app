import 'package:e_cart/screens/Main-App/CartScreen/cart_screen.dart';
import 'package:e_cart/screens/Main-App/CategoryScreen/category_screen.dart';
import 'package:e_cart/screens/Main-App/HomeScreen/home_screen.dart';
import 'package:e_cart/screens/Main-App/ProfileScreen/profile_screen.dart';
import 'package:e_cart/screens/Main-App/frontpage.controller.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Frontpage extends StatelessWidget {
  Frontpage({super.key});

  final Authcontroller _logout = Authcontroller();
  final controller = Get.put(FrontPageController());
  @override
  Widget build(BuildContext context) {
    var navbarItem = [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.category_rounded), label: "Categories"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined), label: "Profile")
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: Column(
            children: [
              Obx(() => Expanded(
                  child: navBody.elementAt(controller.currentnavIndex.value))),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentnavIndex.value,
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: navbarItem,
            onTap: (value) {
              controller.currentnavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
