import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final Color textColor;
  TextLabel({required this.text, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 12),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}
