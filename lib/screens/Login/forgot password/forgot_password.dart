import 'package:e_cart/screens/Login/forgot%20password/forgot_mail.dart';
import 'package:e_cart/screens/Login/forgot%20password/forgot_phone.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Forgotwidget extends StatelessWidget {
  const Forgotwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Make a Selection!",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline5,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
          Text("Select one of the options given below to reset your password",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyText1,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Mail()));
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400]),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.mail_rounded, size: 70.0),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text("E-Mail",
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.headline5,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20)),
                        Text("Reset via E-mail Verification",
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),

          /*******second gesture****** **/
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Phone()));
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400]),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.phone_android_rounded, size: 70.0),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text("Phone no",
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.headline5,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20)),
                        Text("Reset via Phone Verification",
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
