import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/app/modules/beranda/views/beranda_view.dart';
import 'package:flutter_firebase_crud/app/modules/home/views/home_view.dart';
import 'package:flutter_firebase_crud/app/modules/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../../models/users.dart';
import '../controllers/landing_screen_controller.dart';

class LandingScreenView extends GetView<LandingScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: controller.user.doc(controller.cUser!.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.data!.exists) {
              return HomeView();
            }
            var data = snapshot.data?.data();
            if (data == null) {
              return Text('');
            }
            UserD user = UserD.fromJson(data as Map<String, dynamic>);
            if (user.approved == true) {
              return BerandaView();
            }

            return ListView(
              padding: EdgeInsets.symmetric(vertical: 300, horizontal: 30),
              children: [
                Center(child: Text('Menunggu validasi dari Staff Pelayanan')),
                SizedBox(height: 20),
                CustomButton(
                  onpressed: () {
                    controller.signOut();
                  },
                  textButton: Text(
                      controller.isLoading.isFalse ? "KELUAR" : "LOADING..."),
                ),
              ],
            );
          }),
    );
  }
}
