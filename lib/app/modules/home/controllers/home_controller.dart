import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/app/routes/app_pages.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  void signOut() {
    auth.signOut();
    Get.offAllNamed(Routes.HOME);
  }

  void register() async {
    if (emailC.text.isNotEmpty && namaC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );

        isLoading.value = false;
        print(credential);

        await firestore.collection('users').doc(credential.user!.uid).set(
          {
            'name': namaC.text,
            'email': emailC.text,
            'approved': false,
            'uid': credential.user!.uid,
          },
        );

        Get.offAllNamed(Routes.LANDING_SCREEN);
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print(e.code);
        Get.snackbar('GAGAL', 'Email ini tidak valid');
      } catch (e) {
        isLoading.value = false;
        print(e);
      }
    }
  }
}
