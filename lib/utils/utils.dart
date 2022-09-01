import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static double averageRating(List<int> ratings) {
    var averageRating = 0;
    for (int i = 0; i < ratings.length; i++) {
      averageRating = averageRating + ratings[i];
    }
    return double.parse((averageRating / ratings.length).toStringAsFixed(2));
  }

  static void fieldFocusChanged(BuildContext context,
      FocusNode currentFocusNode, FocusNode nextFocusNode) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

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
