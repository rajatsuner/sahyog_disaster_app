import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog2/controllers/global_controller.dart';
import 'package:sahyog2/screens/civil_register_problem_page.dart';
import 'package:sahyog2/screens/my_problems_page.dart';
import 'package:sahyog2/widgets/big_widgets/main_drawer.dart';
import 'package:sahyog2/widgets/big_widgets/map_view.dart';
import 'package:sahyog2/widgets/small_widgets/custom_button.dart';

class CivilHomePage extends StatelessWidget {
  CivilHomePage({Key? key}) : super(key: key);
  GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sahyog"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Get.to(MyProblemsPage());
              },
              child: Text("My problems"),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          //  CivilMapView(),
          CivilMapView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
                text: "Register Problem",
                onTap: () {
                  Get.to(RegisterProblemPage());
                }),
          )
        ],
      ),
      //   drawer: MainDrawer(),
    );
  }
}
