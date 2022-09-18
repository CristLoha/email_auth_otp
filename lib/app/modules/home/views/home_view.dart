import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../widgets/custom_text_input.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        children: [
          Center(
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 40),
          CustomInputText(
            inputType: TextInputType.emailAddress,
            onSendOtpClicked: () {
              controller.sendOTP(controller.emailC.text.trim());
            },
            onValueChanged: (vale) {},
            textColor: Colors.black,
            textEditingController: controller.emailC,
            textFieldErrorText: 'masukan email id',
            textFieldHintText: 'email',
            textFieldIcon: Icons.email,
            textfilledType: 'email',
          ),
          SizedBox(height: 30),
          CustomInputText(
            inputType: TextInputType.number,
            onSendOtpClicked: () {},
            onValueChanged: (vale) {},
            textColor: Colors.black,
            textEditingController: controller.otpC,
            textFieldErrorText: 'masukan nomor otp',
            textFieldHintText: 'OTP',
            textFieldIcon: Icons.email,
            textfilledType: 'otp',
          ),
          SizedBox(height: 30),
          Container(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                controller.validateOTP(
                  controller.emailC.text.trim(),
                  controller.otpC.text.trim(),
                );
              },
              child: Text('KIRIM OTP'),
            ),
          ),
        ],
      ),
    );
  }
}
