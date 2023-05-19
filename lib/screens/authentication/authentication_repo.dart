import 'package:e_cart/screens/Main-App/frontpage.dart';
import 'package:e_cart/screens/authentication/exceptions.dart';
import 'package:e_cart/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseuser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 10));
    firebaseuser = Rx<User?>(_auth.currentUser);
    firebaseuser.bindStream(_auth.userChanges());
    ever(firebaseuser, _setInitialscreen);
  }

  _setInitialscreen(User? user) {
    Future.delayed(const Duration(seconds: 10));
    user == null
        ? Get.offAll(() => const Welcome())
        : Get.offAll(() => const Frontpage());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    Future.delayed(const Duration(seconds: 6));
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseuser.value != null
          ? Get.offAll(() => Frontpage())
          : Get.offAll(() => Welcome());
    } on FirebaseAuthException catch (e) {
      final ex = signupfailure.code(e.code);
      print('Firebase auth exception-${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
