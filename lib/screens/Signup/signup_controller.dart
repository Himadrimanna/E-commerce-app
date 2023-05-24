
import 'package:e_cart/screens/authentication/authentication.functions.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:e_cart/screens/authentication/exceptions.dart';
import 'package:e_cart/screens/indicator/indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  final Authcontroller _authentication = Authcontroller();
  final FirebaseFunction _function = FirebaseFunction();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final password = TextEditingController();

  void onCreateAccount() async {
    if (fullname.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authentication
          .register(email.text.trim(), password.text.trim())
          .then((value) {
        _function.createUserCredential(fullname.text, email.text, phoneno.text);
      });
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
