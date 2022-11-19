import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahyog2/configs/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData preIcon;
  final bool isPasswordType;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.preIcon,
    required this.isPasswordType,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: TextFormField(
        controller: controller,
        onChanged: (String value) {},
        cursorColor: primaryColor,
        obscureText: isPasswordType,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Material(
            elevation: 0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Icon(
              preIcon,
              color: primaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
