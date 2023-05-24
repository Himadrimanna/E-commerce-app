import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart/screens/Main-App/frontpage.dart';
import 'package:e_cart/screens/indicator/indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseFunction {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserCredential(
      String fullname, String email, String phoneno) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .set({
        'uid': _auth.currentUser?.uid,
        'name': fullname,
        'email': email,
        'phone': phoneno
      }).then((value) {
        Indicator.closeLoading();
        Get.offAll(() => Frontpage());
      });
    } catch (e) {
      print(e);
    }
  }
}
