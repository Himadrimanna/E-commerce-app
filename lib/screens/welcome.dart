import 'package:e_cart/screens/route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                "assets/images/Asset2.png",
                height: height * 0.6,
                width: 300,
                scale: 0.2,
              ),
            ),
            Column(
              children: [
                Text(
                  "Welcome to your beloved E-cart",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline5,
                    fontWeight: FontWeight.bold,
                    // fontSize: 20
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 70,
                  width: 350,
                  child: Text(
                    "There's nothing better than online shopping in your PJ's with a glass of wine with the kids asleep!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.bodyText2,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: OutlinedButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Loginpage()));
                          Navigator.push(context, loginRoute());
                        },
                        style: OutlinedButton.styleFrom(
                            shadowColor: Colors.yellow[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.black),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 60)),
                        child: Text(
                          "Login".toUpperCase(),
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ),
                Container(
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Signup()));
                          // Future.delayed(const Duration(milliseconds: 2000))
                          //     .then((_){
                          Navigator.push(context, createRoute());
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            //foregroundColor: Colors.blue,
                            backgroundColor: Colors.black,
                            side: BorderSide(color: Colors.black),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50)),
                        child: Text(
                          "Sign up".toUpperCase(),
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText2,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
