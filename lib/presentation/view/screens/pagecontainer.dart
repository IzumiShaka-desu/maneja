import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja/constant/color_pallete.dart';
import 'package:maneja/presentation/view/screens/home.dart';
import 'package:maneja/presentation/view/screens/login.dart';
import 'package:maneja/presentation/viewmodel/auth_viewmodel.dart';

class PageContainer extends StatelessWidget {
  final AuthViewmodel _authController = Get.find(tag: "ac");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Obx(
        () => Container(
          color: ColorPallete.mainWhite,
          child: _authController.loginStatus.isNull
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _authController.loginStatus.value
                  ? Home()
                  : Login(),
        ),
      ),
    );
  }
}
