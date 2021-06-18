import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/placeholder_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //  libraryController.createNewLibrary(_firebaseUser.value!.uid);
      Get.back();
    } catch (err) {
      Get.snackbar(
        "Error creating acount",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (err) {
      Get.snackbar(
        "Error logging in",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      libraryController.clearList();
      Get.offAll(PlaceHolderPage());
    } catch (err) {
      Get.snackbar(
        "Error signing out",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.snackbar(
        "Reset Password",
        "An email has been sent to $email. Please check you inbox and reset the password",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      Get.snackbar(
        "Error resetting password",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
