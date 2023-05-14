import 'package:e_cart/screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signupfoot extends StatelessWidget {
  const Signupfoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "OR",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(
                  "assets/images/google.png",
                ),
                width: 20.0,
              ),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
              label: Text("Sign in with Google",
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 15))),
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Loginpage()));
            },
            child: Text.rich(TextSpan(
                text: "Already have an Account?",
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15),
                children: [
                  TextSpan(
                    text: " Login".toUpperCase(),
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                        fontSize: 15),
                  )
                ])))
      ],
    );
  }
}
