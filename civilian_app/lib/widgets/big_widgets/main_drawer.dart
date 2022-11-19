import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahyog2/configs/app_theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor.withOpacity(0.6),
      child: ListView(
        children: [
          Container(
            height: 200,
            color: primaryColor.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
