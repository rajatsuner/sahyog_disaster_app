import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sahyog2/configs/app_theme.dart';
import 'package:sahyog2/controllers/global_controller.dart';
import 'package:sahyog2/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  Get.put(GlobalController());

  FirebaseMessaging.instance.subscribeToTopic("abc");
  FirebaseMessaging.instance.subscribeToTopic("110075");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SahYog',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(elevation: 0, backgroundColor: primaryColor),
          primaryColor: primaryColor),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
