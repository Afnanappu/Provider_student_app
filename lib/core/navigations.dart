import 'package:flutter/material.dart';

class Nav {

  // to go next page
  static void push(BuildContext context, Widget screen) {
    if (context.mounted) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => screen,
      ));
    }
  }

  //to go back (previous screen)
  static void pop(BuildContext context) {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
