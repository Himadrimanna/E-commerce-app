import 'package:e_cart/screens/Signup/signup_foot.dart';
import 'package:e_cart/screens/Signup/signup_form.dart';
import 'package:e_cart/screens/Signup/signup_head.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
              Signuphead(size: size),
              const SignupForm(),
              const Signupfoot()
            ],
          ),
        ),
      ),
    ));
  }
}
