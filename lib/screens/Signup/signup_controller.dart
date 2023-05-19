import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final password = TextEditingController();

  void registeruser(String email, String password) {
    AuthenticationRepo.instance.createUserWithEmailAndPassword(email, password);
  }
}
