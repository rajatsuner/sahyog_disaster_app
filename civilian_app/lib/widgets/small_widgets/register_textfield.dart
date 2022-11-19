import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahyog2/configs/app_theme.dart';

class RegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const RegisterTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.multiline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: TextFormField(
          controller: controller,
          maxLines: null,
          onChanged: (String value) {},
          cursorColor: primaryColor,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5)),
        ),
      ),
    );
  }
}
