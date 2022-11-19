import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog2/controllers/global_controller.dart';
import 'package:sahyog2/models/my_problems_model.dart';

class MyProblemsPage extends StatefulWidget {
  const MyProblemsPage({super.key});

  @override
  State<MyProblemsPage> createState() => _MyProblemsPageState();
}

class _MyProblemsPageState extends State<MyProblemsPage> {
  GlobalController gc = Get.find();
  late DatabaseReference dbref;

  List<MyProblems> myProblemsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProblemsList();
  }

  getProblemsList() async {
    FirebaseDatabase.instance
        .ref("civilCred/" + gc.phoneNumber.value + "/problems/")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        List<DataSnapshot> idInst = snapshot.children.toList();
        for (var inst in idInst) {
          String key = inst.key!;

          FirebaseDatabase.instance
              .ref("problemsData/" + key + "/")
              .get()
              .then((value) {
            var data = jsonDecode(jsonEncode(value.value));
            setState(() {
              myProblemsList.add(MyProblems(
                  textMessage: data['textMessage'],
                  latitude: data["latitude"],
                  by: data["by"],
                  longitude: data["longitude"],
                  address: data["address"],
                  problemDate: data["problemDate"],
                  problemTime: data["problemTime"],
                  numOfPerson: data["numOfPerson"],
                  mainProblemType: data["mainProblemType"],
                  status: data["open"],
                  pinCode: data["pinCode"],
                  problemId: key));
            });
          });
        }
      } else {
        print('No data available.1');
      }
    });
    print(myProblemsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My problems"),
      ),
      body: ListView.builder(
          itemCount: myProblemsList.length,
          itemBuilder: ((context, index) {
            return Text(myProblemsList[index].textMessage);
          })),
    );
  }
}
