import 'package:e_cart/screens/Main-App/frontpage.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:e_cart/screens/complete%20profile/user_model.dart';
import 'package:e_cart/screens/complete%20profile/user_repository.dart';
import 'package:e_cart/screens/indicator/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final CreateUser _function = CreateUser();
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final countryController = TextEditingController();

  final authrepo = Get.put(Authcontroller());
  final userrepo = Get.put(CreateUser());
  getUserDetails() {
    final email = authrepo.firebaseuser.value?.email;
    if (email != null) {
      return userrepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  getUserDetails1() {
    final email = authrepo.firebaseuser.value?.email;
    if (email != null) {
      return userrepo.getUserDetails1(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  void userAddress() async {
    Indicator.showLoading();
    final address = UserModel2(
      address1: addressLine1Controller.text.trim(),
      address2: addressLine2Controller.text.trim(),
      city: cityController.text.trim(),
      zipcode: zipCodeController.text.trim(),
      state: stateController.text.trim(),
      country: countryController.text.trim(),
    );
    _function.userProfile(address);
    Indicator.closeLoading();
    await Get.offAll(Frontpage());
  }
}
