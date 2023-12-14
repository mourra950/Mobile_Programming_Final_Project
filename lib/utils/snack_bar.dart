import 'package:flutter/material.dart';

class SBar {
  static void showSnackBar({required var context, required String message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
