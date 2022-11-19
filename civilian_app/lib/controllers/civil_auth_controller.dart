import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sahyog2/configs/global_variables.dart';
import 'package:sahyog2/controllers/global_controller.dart';
import 'package:sahyog2/screens/civil_homepage.dart';

enum CivilAuth { login, signup }

class CivilAuthController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  CivilAuth civilAuth = CivilAuth.login;
  GlobalController globalController = Get.find();
  late DatabaseReference civilCredRef;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    civilCredRef = FirebaseDatabase.instance.ref("civilCred");
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  checkSignupDetailValidation() {
    if (nameController.text.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        title: "Ops!!",
        messageText: Text(
          "Phone number is invalid",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    if (phoneController.text.length != 10) {
      Get.showSnackbar(GetSnackBar(
        title: "Ops!!",
        messageText: Text(
          "Phone number is invalid",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        title: "Ops!!",
        messageText: Text(
          "Password must not be empty",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ));

      return;
    }
    signUp();
  }

  signUp() {
    print(nameController.text);
    print(passwordController.text);
    print(phoneController.text);
    civilCredRef = FirebaseDatabase.instance.ref("civilCred");
    civilCredRef.child(phoneController.text).set({
      "name": nameController.text,
      "phoneNum": phoneController.text,
      "password": passwordController.text
    }).whenComplete(() {
      globalController.name.value = nameController.text;
      globalController.password.value = passwordController.text;
      globalController.phoneNumber.value = phoneController.text;
      saveDetails();
    });
  }

  checkLoginDetailValidation() {
    if (phoneController.text.length != 10) {
      Get.showSnackbar(GetSnackBar(
        title: "Ops!!",
        messageText: Text(
          "Phone number is invalid",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        title: "Ops!!",
        messageText: Text(
          "Password must not be empty",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ));

      return;
    }
    loginCheckCred();
  }

  loginCheckCred() async {
    print(nameController.text);
    print(passwordController.text);
    print(phoneController.text);

    DataSnapshot data = await civilCredRef.child(phoneController.text).get();

    bool isUserExist = data.exists;

    if (isUserExist) {
      if (data.child("password").value == passwordController.text) {
        globalController.name.value = data.child("name").value.toString();
        globalController.password.value = passwordController.text;
        globalController.phoneNumber.value = phoneController.text;
        saveDetails();
      } else {
        Get.showSnackbar(GetSnackBar(
          title: "Ops!!",
          messageText: Text(
            "Wrong password",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 2),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        title: "Ops!!",
        messageText: Text(
          "Invalid/ Unregistered number",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }

  saveDetails() async {
    var box = await Hive.openBox(GlobalVariables.userDetailBox);
    box.put(GlobalVariables.name, globalController.name.value);
    box.put(GlobalVariables.phoneNumber, globalController.phoneNumber.value);
    box.put(GlobalVariables.password, globalController.password.value);
    Get.off(CivilHomePage());
  }
}
