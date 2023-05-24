
import 'package:e_cart/screens/Main-App/frontpage.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:e_cart/screens/authentication/exceptions.dart';
import 'package:e_cart/screens/indicator/indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  final Authcontroller _authentication = Authcontroller();

  final email = TextEditingController();
  final password = TextEditingController();

  void onLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Indicator.showLoading();
      try {
        await _authentication
            .login(email.text.trim(), password.text.trim())
            .then((value) {
          Indicator.closeLoading();
          Get.offAll(Frontpage());
        });
      } catch (e) {
        Indicator.closeLoading();
        final e = Signuprequire();
        Get.snackbar('Error', '${e.message}');
        // Handle login failure
        print('Login failed: ${e.message}');
      }
    } else {
      final e = Signuprequire();
      Get.snackbar('Error', '${e.message}');
    }
    email.clear();
    password.clear();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    // Dispose other controllers if added

    super.dispose();
  }
}
