import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatelessWidget {
  String username;
  Otp({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CO\nDE",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 80)),
            Text("VERIFICATION",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14)),
            SizedBox(
              height: 40,
            ),
            Text("Enter the verification code send at $username",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
            SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
            ),
          ],
        ),
      ),
    );
  }
}
