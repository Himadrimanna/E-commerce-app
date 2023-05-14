import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signuphead extends StatelessWidget {
  const Signuphead({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/Asset3.png",
          height: size.height * 0.2,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Joined with us",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headline5,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        Text(
          "Register here please",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyText1,
              //fontWeight: FontWeight.bold,
              color: Colors.black),
        )
      ],
    );
  }
}
