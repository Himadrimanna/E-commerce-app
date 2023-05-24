import 'package:e_cart/screens/Signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _obscureText = true;

  Country country = Country(
      countryCode: 'IN',
      e164Key: '',
      displayName: 'India',
      e164Sc: 0,
      example: 'India',
      geographic: true,
      level: 1,
      name: 'India',
      phoneCode: '91',
      displayNameNoCountryCode: 'IN');

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullname,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_2_rounded,
                      color: Colors.black,
                    ),
                    labelText: "Full Name",
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Colors.black,
                    ),
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.phoneno,
                decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(14),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme:
                                  CountryListThemeData(bottomSheetHeight: 500),
                              onSelect: (value) {
                                setState(() {
                                  country = value;
                                });
                              });
                        },
                        child: Text(
                          "${country.flagEmoji} + ${country.phoneCode}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    labelText: "Phone no",
                    hintText: "Phone no",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Phone no';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.password,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.fingerprint_rounded,
                      color: Colors.black,
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye_rounded,
                        color: Colors.black,
                      ),
                    )),
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registered')),
                          );
                          controller.onCreateAccount();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          //foregroundColor: Colors.blue,
                          backgroundColor: Colors.black,
                          side: BorderSide(color: Colors.black),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50)),
                      child: Text("Sign Up".toUpperCase(),
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 15)))),
            ],
          ),
        ));
  }
}
