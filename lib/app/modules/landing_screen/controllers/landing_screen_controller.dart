import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_crud/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? cUser = FirebaseAuth.instance.currentUser;
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  void signOut() {
    auth.signOut();
    Get.offAllNamed(Routes.HOME);
  }
}
