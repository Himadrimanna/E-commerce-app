import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:flutter/material.dart';

class Frontpage extends StatelessWidget {
  Frontpage({super.key});

  final Authcontroller _logout = Authcontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: IconButton(
          icon: Icon(Icons.person_2_rounded),
          onPressed: () {
            _logout.logOut();
          },
        )),
      ),
    );
  }
}
