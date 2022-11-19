import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sahyog2/controllers/register_problem_controller.dart';

class ProblemTypeDropDown extends StatefulWidget {
  const ProblemTypeDropDown({super.key});

  @override
  State<ProblemTypeDropDown> createState() => _ProblemTypeDropDownState();
}

class _ProblemTypeDropDownState extends State<ProblemTypeDropDown> {
  // Initial Selected Value
  String problemTypeValue = 'Fire';
  RegisterProblemController rpc = Get.find();

  // List of items in our dropdown menu
  var problemTypeItems = [
    'Fire',
    'Flood',
    'Earthquake',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // Initial Value
      value: problemTypeValue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: problemTypeItems.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          rpc.mainProblemType = newValue!;
          problemTypeValue = newValue!;
        });
      },
    );
  }
}
