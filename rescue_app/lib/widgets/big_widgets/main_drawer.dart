import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog2/configs/app_theme.dart';
import 'package:sahyog2/controllers/global_controller.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  GlobalController globalController = Get.find();
  GlobalController gc = Get.find();
  var alertList = [];
  late DatabaseReference alertRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlertDetails();
  }

  getAlertDetails() async {
    alertRef = FirebaseDatabase.instance.ref('problemsData');
    var res = await alertRef.get();
    print(res.value);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListVi
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 57, 79, 241),
            ),
            child: Text(
              '${globalController.name.value}\n\n'
              '${globalController.phoneNumber.value}',
              style: TextStyle(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: const Text('Alerts And Notification',
                style: TextStyle(fontSize: 25)),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Alerts And Notification'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                gc.logOutUser();
              },
              tileColor: Color.fromARGB(255, 231, 228, 228),
              leading: Icon(Icons.logout),
              title: Text("Log out"),
            ),
          )
        ],
      ),
    );
  }
}
