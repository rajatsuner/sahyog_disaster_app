import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextSubLabel extends StatelessWidget {
  final String text;
  TextSubLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Material(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
