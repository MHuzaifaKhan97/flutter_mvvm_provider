import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static errorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 17)),
      backgroundColor: Colors.red,
    ));
  }

  static snackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 17)),
      backgroundColor: Colors.black,
    ));
  }
}
