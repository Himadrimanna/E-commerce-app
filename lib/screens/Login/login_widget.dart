import 'package:e_cart/screens/Login/forgot%20password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
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
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint_rounded,
                  color: Colors.black,
                ),
                labelText: "Password",
                hintText: "Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
            height: 5,
          ),

          /****8 forgot button******/
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      context: context,
                      builder: (context) => Forgotwidget());
                },
                child: Text(
                  "Forget Password?",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                    fontWeight: FontWeight.w500,
                  ),
                  selectionColor: Colors.grey,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      //foregroundColor: Colors.blue,
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.black),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                  child: Text("Login".toUpperCase(),
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
