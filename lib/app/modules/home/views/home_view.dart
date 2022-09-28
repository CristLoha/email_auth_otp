import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/app/modules/widgets/custom_button.dart';

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
            inputType: TextInputType.name,
            textColor: Colors.black,
            textEditingController: controller.namaC,
            textFieldHintText: 'Nama',
            textFieldIcon: Icons.person,
          ),
          SizedBox(height: 30),
          CustomInputText(
            inputType: TextInputType.emailAddress,
            textColor: Colors.black,
            textEditingController: controller.emailC,
            textFieldHintText: 'Email',
            textFieldIcon: Icons.email,
          ),
          SizedBox(height: 30),
          CustomInputText(
            textEditingController: controller.passC,
            inputType: TextInputType.visiblePassword,
            textColor: Colors.black,
            textFieldHintText: 'Password',
            textFieldIcon: Icons.key,
          ),
          SizedBox(height: 30),
          Obx(
            () => CustomButton(
              onpressed: () {
                controller.register();
              },
              textButton: Text(
                  controller.isLoading.isFalse ? "REGISTER" : "LOADING..."),
            ),
          ),
        ],
      ),
    );
  }
}
