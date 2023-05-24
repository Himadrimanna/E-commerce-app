import 'package:e_cart/screens/Login/forgot%20password/otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
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
                    child: Text("Enter your Phone-no to verify your account",
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone_rounded,
                                    color: Colors.black,
                                  ),
                                  labelText: "Phone-no",
                                  hintText: "Phone-no",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Phone-no';
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
                                            username: '',
                                          ),
                                        ));
                                      }
                                      Map<String, String> data = {
                                        "field": sampledata1.text
                                      };
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
