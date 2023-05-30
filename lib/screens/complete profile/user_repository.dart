import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart/screens/complete%20profile/user_model.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUser {
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserCredential(UserModel user) async {
    User? profile = _auth.currentUser;

    if (profile != null) {
      String uid = profile.uid;
      await _db
          .collection("Users")
          .doc(uid)
          .set(user.toJson())
          .whenComplete(
            () => Get.snackbar('Success', 'Your account has been created',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green),
          )
          .catchError((error, stackTrace) {
        Get.snackbar('Error', 'Something went Wrong. Try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        print(error.toString());
      });
    }
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userdata = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userdata;
  }

/*********** User profile************ */
  Future<void> userProfile(
    UserModel2 address,
  ) async {
    User? user = _auth.currentUser;

    if (user != null) {
      String uid = user.uid;
      await _db
          .collection("Users")
          .doc(uid)
          .set(address.toJson1(), SetOptions(merge: true))
          .whenComplete(
            () => Get.snackbar('Success', 'Address has been saved',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green),
          )
          .catchError((error, stackTrace) {
        Get.snackbar('Error', 'Something went Wrong. Try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        print(error.toString());
      });
    }
  }
}
