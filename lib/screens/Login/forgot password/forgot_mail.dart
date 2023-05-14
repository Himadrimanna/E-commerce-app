import 'package:e_cart/screens/Login/forgot%20password/otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mail extends StatefulWidget {
  const Mail({super.key});

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController sampledata1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Asset4.png",
                    height: size.height * 0.4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Forget Password",
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Enter your E-mail to verify your account",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 17)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: sampledata1,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    color: Colors.black,
                                  ),
                                  labelText: "Email",
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => Otp(
                                                      username:
                                                          sampledata1.text,
                                                    )));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        //foregroundColor: Colors.blue,
                                        backgroundColor: Colors.black,
                                        side: BorderSide(color: Colors.black),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 50)),
                                    child: Text("Next".toUpperCase(),
                                        style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15)))),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
