import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja/constant/color_pallete.dart';
import 'package:maneja/constant/util.dart';
import 'package:maneja/presentation/viewmodel/auth_viewmodel.dart';

class Register extends StatelessWidget {
  final AuthViewmodel _authViewmodel = Get.find(tag: "ac");
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: ColorPallete.mainWhite,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: Get.height / 5,
                  color: ColorPallete.mainBlue,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: circularRadius(
                          Get.height / 5,
                        ),
                      ),
                      color: ColorPallete.mainWhite,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: SizedBox(
                  height: Get.height / 3,
                  child: Container(
                    color: ColorPallete.mainBlue,
                  ),
                ),
              ),
              Positioned(
                bottom: Get.height / 10,
                child: Container(
                  height: Get.width,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorPallete.mainWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: circularRadius(
                        0,
                      ),
                      topRight: circularRadius(
                        Get.width,
                      ),
                      bottomLeft: circularRadius(
                        0,
                      ),
                      bottomRight: circularRadius(
                        Get.width,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: Get.width / 2.2,
                  height: Get.width / 2.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: circularRadius(
                        Get.width / 2.2,
                      ),
                    ),
                    color: ColorPallete.mainWhite,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: circularRadius(
                          Get.width / 2.5,
                        ),
                      ),
                      color: ColorPallete.mainOrange,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width / 2,
                  height: (Get.width / 2.1) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: circularRadius(
                        Get.width / 2,
                      ),
                    ),
                    color: ColorPallete.mainWhite,
                  ),
                  padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: circularRadius(
                          Get.width / 2,
                        ),
                      ),
                      color: ColorPallete.mainGrey,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 20),
                  child: Obx(
                    () => Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'Register',
                            style: Get.theme.textTheme.headline4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              enabled: _authViewmodel.isLoginLoading.value
                                  ? false
                                  : true,
                              controller: _emailController,
                              decoration: createInputDecoration(
                                label: 'email',
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                ),
                              ),
                              validator: (email) {
                                if (email.isEmpty) {
                                  return "email cannot be null";
                                } else if (!email.trim().isEmail) {
                                  return "it is not valid email";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              enabled: _authViewmodel.isLoginLoading.value
                                  ? false
                                  : true,
                              controller: _passwordController,
                              validator: (password) {
                                if (password.isEmpty) {
                                  return "password cannot be null";
                                } else if (password.trim().length < 6) {
                                  return "password cannot be less then 6 character";
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: createInputDecoration(
                                label: 'password',
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _authViewmodel.isLoginLoading.value
                                  ? Center(
                                      child: RefreshProgressIndicator(),
                                    )
                                  : Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: MaterialButton(
                                          onPressed: () => executeRegister(),
                                          child: Text(
                                            'Register',
                                            style: Get.theme.textTheme.subtitle2
                                                .copyWith(color: Colors.white),
                                          ),
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  executeRegister() async {
    if (_formKey.currentState.validate()) {
      _authViewmodel.register(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }
}
