import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog2/configs/app_theme.dart';
import 'package:sahyog2/controllers/civil_auth_controller.dart';
import 'package:sahyog2/widgets/small_widgets/custom_button.dart';
import 'package:sahyog2/widgets/small_widgets/custom_textfield.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  var civilAuthController = Get.put(CivilAuthController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(gradient: backGroundGradient),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GetBuilder<CivilAuthController>(builder: (_) {
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
                            "SahYog Civilian",
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
                if (civilAuthController.civilAuth == CivilAuth.login)
                  Form(
                    key: civilAuthController.loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: civilAuthController.phoneController,
                          hintText: "Phone number (+91)",
                          preIcon: Icons.phone,
                          isPasswordType: false,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: civilAuthController.passwordController,
                            hintText: "Password",
                            preIcon: Icons.password,
                            isPasswordType: true),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            text: "Login",
                            onTap: () {
                              civilAuthController.checkLoginDetailValidation();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "FORGOT PASSWORD ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an Account ? ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            InkWell(
                              onTap: () {
                                // setState(() {
                                civilAuthController.civilAuth =
                                    CivilAuth.signup;
                                civilAuthController.update();
                                //  });
                              },
                              child: Text("Sign Up ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                if (civilAuthController.civilAuth == CivilAuth.signup)
                  Form(
                    key: civilAuthController.signupFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: civilAuthController.nameController,
                          hintText: "Name",
                          preIcon: Icons.perm_identity,
                          isPasswordType: false,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: civilAuthController.phoneController,
                          hintText: "Phone number (+91)",
                          preIcon: Icons.phone,
                          isPasswordType: false,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: civilAuthController.passwordController,
                          hintText: "Password",
                          preIcon: Icons.password,
                          isPasswordType: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            text: "Signup",
                            onTap: () {
                              civilAuthController.signUp();
                            }),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an Account ? ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            InkWell(
                              onTap: () {
                                //  setState(() {
                                civilAuthController.civilAuth = CivilAuth.login;
                                civilAuthController.update();

                                ///  });
                              },
                              child: Text("Login In ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        )
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
