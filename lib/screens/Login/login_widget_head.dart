import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginhead extends StatelessWidget {
  const Loginhead({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/Asset3.png",
          height: size.height * 0.3,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome Back Buddy,",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headline5,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        Text(
          "Login here please",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyText1,
              //fontWeight: FontWeight.bold,
              color: Colors.black),
        )
      ],
    );
  }
}
