import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog2/configs/app_theme.dart';
import 'package:sahyog2/controllers/rescue_auth_controller.dart';
import 'package:sahyog2/widgets/small_widgets/custom_button.dart';
import 'package:sahyog2/widgets/small_widgets/custom_textfield.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  var rescueAuthController = Get.put(RescueAuthController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(gradient: backGroundGradient),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GetBuilder<RescueAuthController>(builder: (_) {
            return ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset(
                            "assets/logo.png",
                            width: Get.height * 0.2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "SahYog Rescuers",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      width: double.infinity,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                if (rescueAuthController.rescueAuth == RescueAuth.login)
                  Form(
                    key: rescueAuthController.loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: rescueAuthController.phoneController,
                          hintText: "Phone number (+91)",
                          preIcon: Icons.phone,
                          isPasswordType: false,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: rescueAuthController.passwordController,
                            hintText: "Password",
                            preIcon: Icons.password,
                            isPasswordType: true),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            text: "Login",
                            onTap: () {
                              rescueAuthController.checkLoginDetailValidation();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
