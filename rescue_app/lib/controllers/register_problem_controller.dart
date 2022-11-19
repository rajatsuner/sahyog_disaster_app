import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahyog2/controllers/global_controller.dart';
import 'package:sahyog2/models/register_problem_model.dart';
import 'package:sahyog2/widgets/small_widgets/text_label.dart';

class RegisterProblemController extends GetxController {
  var textMessageController = TextEditingController();
  var numOfPersonController = TextEditingController();
  GlobalController globalController = Get.find();

  late RegisterProblem problemData;

  late bool serviceEnabled;
  late LocationPermission permission;
  late Position position;
  bool isGotLocation = false;

  //Obeservable
  RxString name = 'person name'.obs;
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxString address = 'loading'.obs;

  // @override
  // onInit() {
  //   super.onInit();

  // }

  getUpdatePositionDetail() {
    name.value = globalController.name.value;
    print(
        "checking ${globalController.name.value} ${globalController.phoneNumber.value} ${globalController.password.value}");
    update();
    print("updating again again ");
    registerProblem();
  }

  registerProblem() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Future.error('Location services are disabled.');
    } else {
      print("permisison enabled");
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Future.error('Location permissions are denied');
        } else {
          if (permission == LocationPermission.deniedForever) {
            // Permissions are denied forever, handle appropriately.
            showNoLocationPermission();
          } else {}
        }
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    print("position is :: $position");
    longitude.value = position.longitude;
    latitude.value = position.latitude;
    update();
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude.value, longitude.value);
      Placemark place = placemarks[0];
      print(place);
      address.value =
          "${place.locality}, ${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}";
    } on Exception catch (e) {
      // TODO
    }
    isGotLocation = true;
    update();
  }

  showNoLocationPermission() {
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 2),
      messageText: TextLabel(text: "Please allow location permission"),
      backgroundColor: Colors.redAccent,
    ));
    Get.back();
  }

  sendRequest(Map<String, dynamic> problemJson) async {
    print(problemJson);
    try {
      var response = await Dio().get(
          'http://server-sahyog.herokuapp.com/register-problem',
          queryParameters: problemJson);
      print(response);
      if (response.data["registerStatus"] == "yes") {
        Get.back();
        Get.back();
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 2),
          messageText: TextLabel(
            text: "Problem Registered Successully",
            textColor: Colors.white,
          ),
          backgroundColor: Colors.green,
        ));
      } else {
        Get.back();
        Get.back();
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 2),
          title: "Problem not registered",
          messageText: TextLabel(
            text: response.data["message"],
            textColor: Colors.white,
          ),
          backgroundColor: Colors.redAccent,
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  registerProblemFinal() async {
    var datetime = DateTime.now();
    if (textMessageController.text.trim().isNotEmpty &&
        numOfPersonController.text.trim().isNotEmpty &&
        isGotLocation) {
      problemData = RegisterProblem(
          by: name.value,
          textMessage: textMessageController.text.trim(),
          latitude: latitude.value,
          longitude: longitude.value,
          numOfPerson: int.tryParse(numOfPersonController.text.trim())!,
          address: address.value,
          problemDate: "${datetime.day}-${datetime.month}-${datetime.year}",
          problemTime:
              "${datetime.hour}:${datetime.minute}:${datetime.second}");

      //register problem loading time
      Get.dialog(Material(
        child: Center(
          child: ListTile(
              leading: CircleAvatar(
                child: CircularProgressIndicator(),
              ),
              title: Text("Registering problem wait")),
        ),
      ));
      sendRequest({
        "by": problemData.by,
        "textMessage": problemData.textMessage,
        "longitude": problemData.longitude,
        "latitude": problemData.latitude,
        "address": problemData.address,
        "numOfPerson": problemData.numOfPerson,
        "problemDate": problemData.problemDate,
        "problemTime": problemData.problemTime,
      });
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        messageText: TextLabel(
          text: "Num of person or problem cannot be empty",
          textColor: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}
