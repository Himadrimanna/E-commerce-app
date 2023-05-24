import 'package:e_cart/screens/Login/login.dart';
import 'package:e_cart/screens/Signup/signup.dart';
import 'package:e_cart/screens/welcome.dart';
import 'package:flutter/material.dart';

Route createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2500),
    pageBuilder: (context, animation, secondaryAnimation) => Signup(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 2.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route loginRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2500),
    pageBuilder: (context, animation, secondaryAnimation) => Loginpage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 2.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
