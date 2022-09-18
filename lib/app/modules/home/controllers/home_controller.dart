import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController otpC = TextEditingController();
  EmailAuth emailAuth = EmailAuth(sessionName: 'aplikasi dukcapil');
  RxString status = ''.obs;

  void sendOTP(String email) async {
    try {
      await emailAuth.sendOtp(recipientMail: email, otpLength: 5);
      Get.snackbar('SUSKSES', 'Kode Otp berhasil dikirim');
    } catch (e) {
      Get.snackbar('GAGAL', 'Tidak dapat mengirim OTP');
      print(e);
    }
  }

  void validateOTP(String email, String otp) async {
    var res = emailAuth.validateOtp(recipientMail: email, userOtp: otp);
    if (res) {
      Get.snackbar('BERHASIL', 'OTP diverifikasi');
    } else {
      Get.snackbar('GAGAL', 'nomor OTP salah');
    }
  }
}
