
//import 'package:e_cart/screens/authentication/authentication.functions.dart';
import 'package:e_cart/screens/Signup/signup_form.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:e_cart/screens/authentication/exceptions.dart';
import 'package:e_cart/screens/complete%20profile/profile_complete_screen.dart';
import 'package:e_cart/screens/complete%20profile/user_model.dart';
import 'package:e_cart/screens/complete%20profile/user_repository.dart';
import 'package:e_cart/screens/indicator/indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  final Authcontroller _authentication = Authcontroller();
  final CreateUser _function = CreateUser();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SignupForm code = const SignupForm();

  void onCreateAccount() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authentication
          .register(email.text.trim(), password.text.trim())
          .then((value) {
        final user = UserModel(
            id: _auth.currentUser?.uid,
            fullname: fullname.text.trim(),
            email: email.text.trim(),
            phoneno: phoneno.text.trim(),
            password: password.text.trim());
        _function.createUserCredential(user);
      });
      Get.offAll(() => Profile());
    } else {
      final e = Signuprequire();
      Get.snackbar('Error', '${e.message}');
    }
    fullname.clear();
    email.clear();
    phoneno.clear();
    password.clear();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    fullname.dispose();
    phoneno.dispose();

    // Dispose other controllers if added

    super.dispose();
  }
}
