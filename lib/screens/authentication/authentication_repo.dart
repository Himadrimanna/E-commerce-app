import 'package:e_cart/screens/Main-App/frontpage.dart';
import 'package:e_cart/screens/authentication/exceptions.dart';

import 'package:e_cart/screens/splash_screen.dart';
import 'package:e_cart/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class Authcontroller extends GetxController {
  static Authcontroller instance = Get.find();
  late Rx<User?> firebaseuser;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    firebaseuser = Rx<User?>(auth.currentUser);
    firebaseuser.bindStream(auth.userChanges());
    ever(firebaseuser, _initialScreen);
  }

  _initialScreen(User? user) {
    Get.offAll(() => SplashScreen());
    user == null
        ? Get.offAll(() => const Welcome())
        : Get.offAll(() => Frontpage());
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = Signupfailure.code(e.code);
      Get.snackbar('Error', '${ex.message}');
      print('Firebase auth exception-${ex.message}');
      throw ex;
    } catch (e) {
      Get.snackbar('Error', 'Account creation failed');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = Loginfailure.code(e.code);
      Get.snackbar('Error', '${ex.message}');
      print('Firebase auth exception-${ex.message}');
      throw ex;
    } catch (e) {
      Get.snackbar('Error', 'Login failed');
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
      Get.offAll(() => Welcome());
    } catch (e) {
      Get.snackbar(
          'Error', "Can't be done , Services are temporarily not available");
    }
  }
}
