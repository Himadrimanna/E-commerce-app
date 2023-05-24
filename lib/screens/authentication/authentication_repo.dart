// //import 'package:e_cart/screens/Main-App/frontpage.dart';
// import 'package:e_cart/screens/authentication/exceptions.dart';
// import 'package:e_cart/screens/welcome.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

// // class AuthenticationRepo extends GetxController {
// //   static AuthenticationRepo get instance => Get.find();

// //   final _auth = FirebaseAuth.instance;
// //   late final Rx<User?> firebaseuser;

// //   @override
// //   void onReady() async {
// //     await Future.delayed(const Duration(seconds: 10));
// //     firebaseuser = Rx<User?>(_auth.currentUser);
// //     firebaseuser.bindStream(_auth.userChanges());
// //     ever(firebaseuser, _setInitialscreen);
// //   }

// //   _setInitialscreen(User? user) {
// //     Future.delayed(const Duration(seconds: 10));
// //     user == null
// //         ? Get.offAll(() => const Welcome())
// //         : Get.offAll(() => const Frontpage());
// //   }

// //   Future<void> createUserWithEmailAndPassword(
// //       String email, String password) async {
// //     Future.delayed(const Duration(seconds: 6));
// //     try {
// //       await _auth.createUserWithEmailAndPassword(
// //           email: email, password: password);
// //       firebaseuser.value != null
// //           ? Get.offAll(() => Frontpage())
// //           : Get.offAll(() => Welcome());
// //     } on FirebaseAuthException catch (e) {
// //       final ex = signupfailure.code(e.code);
// //       Get.snackbar('Error', '${ex.message}');
// //       print('Firebase auth exception-${ex.message}');
// //       throw ex;
// //     }
// //   }

// //   Future<void> loginUserWithEmailAndPassword(
// //       String email, String password) async {
// //     try {
// //       await _auth.signInWithEmailAndPassword(email: email, password: password);
// //       firebaseuser.value != null
// //           ? Get.offAll(() => Frontpage())
// //           : Get.offAll(() => Welcome());
// //     } on FirebaseAuthException catch (e) {
// //       final ex = signupfailure.code(e.code);
// //       Get.snackbar('Error', '${ex.message}');
// //       print('Firebase auth exception-${ex.message}');
// //       throw ex;
// //     }
// //   }

// //   Future<void> logout() async => await _auth.signOut();
// // }
// // ///

// class FirebaseAuthentication {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> createaccount(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       final ex = Signupfailure.code(e.code);
//       Get.snackbar('Error', '${ex.message}');
//       print('Firebase auth exception-${ex.message}');
//       throw ex;
//     }
//   }

//   Future<void> login(String email, String password) async {
//     try {
//       if (_auth != null) {
//         await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//       } else {
//         throw FirebaseAuthException(
//             code: 'auth-error', message: 'Firebase instance is null');
//       }
//     } on FirebaseAuthException catch (e) {
//       final ey = Loginfailure.code(e.code);
//       Get.snackbar("Error", '${ey.message}');
//       print('Firebase auth exception-${ey.message}');
//       throw ey;
//     }
//   }

//   Future<void> logOut() async {
//     try {
//       await _auth.signOut();
//       Get.offAll(() => Welcome());
//     } catch (e) {}
//   }

//   Future<void> sendEmailVerification() async {
//     try {
//       await _auth.currentUser?.sendEmailVerification();
//     } on FirebaseAuthException catch (e) {
//       final ex = TExceptions.code(e.code);
//       throw ex.message;
//     } catch (_) {
//       const ex = TExceptions();
//       throw ex.message;
//     }
//   }
// }

import 'package:e_cart/screens/Main-App/frontpage.dart';
import 'package:e_cart/screens/authentication/exceptions.dart';
import 'package:e_cart/screens/indicator/indicator.dart';
import 'package:e_cart/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  static Authcontroller instance = Get.find();
  late Rx<User?> _firebaseuser;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500));
    _firebaseuser = Rx<User?>(auth.currentUser);
    _firebaseuser.bindStream(auth.userChanges());
    ever(_firebaseuser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Indicator.showLoading();
      print('Redirect to Welcome page');
      Get.offAll(() => Welcome());
    } else {
      Indicator.closeLoading();
      print('Redirect to front page');
      Get.offAll(() => Frontpage());
    }
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
