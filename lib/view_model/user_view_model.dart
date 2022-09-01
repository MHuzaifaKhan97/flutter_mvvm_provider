import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString('token', user.token!.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    final String? token = _pref.getString("token");
    return UserModel(token: token.toString());
  }

  Future<bool> removeUser() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.clear();
  }
}
