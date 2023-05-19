import 'package:e_cart/screens/Signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _obscureText = true;
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
                      borderRadius: BorderRadius.circular(5),
                    )),
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
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.phoneno,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    labelText: "Phone no",
                    hintText: "Phone no",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
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
                        borderRadius: BorderRadius.circular(5)),
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
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Signupcontroller.instance.registeruser(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                        }
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
