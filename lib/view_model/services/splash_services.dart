import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/model/user_model.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';

class SplashServices {
  void CheckAuthentication(BuildContext context) async {
    Future<UserModel> getUserData() => UserViewModel().getUser();
    getUserData().then((value) async {
      if (value.token == "null" || value.token == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (_) => false);
      } else {
        await Future.delayed(Duration(seconds: 3));

        Navigator.pushNamed(context, RoutesName.home);
      }
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
