import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final String text;
  TextDisplay({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.all(Radius.circular(5)),
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
