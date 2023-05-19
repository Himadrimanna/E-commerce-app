import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:e_cart/screens/route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 6200)).then((_) {
      Navigator.pushReplacement(context, createRoute());
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.3),
            Image.asset(
              "assets/images/Asset1.png",
              height: 200,
              width: 200,
              scale: 0.2,
            ),
            //Lottie.asset("assets/animation/ecommerce2.json",
            //  height: 300, width: 500, animate: true),
          ],
        ),
      ),
    );
  }
}
