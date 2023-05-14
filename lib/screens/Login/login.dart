import 'package:e_cart/screens/Login/login_widget.dart';
import 'package:e_cart/screens/Login/login_widget_foot.dart';
import 'package:e_cart/screens/Login/login_widget_head.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Loginhead(size: size),
                const LoginForm(),
                const Loginfoot(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
