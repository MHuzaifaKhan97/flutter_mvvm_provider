import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/model/user_model.dart';
import 'package:flutter_mvvm_provider/repository/auth_repository.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utils/utils.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginApi(data).then((value) {
      if (kDebugMode) print(value.toString());
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.errorMessage(error.toString(), context);
    });
  }

  Future<void> registerAPI(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.registerAPI(data).then((value) {
      if (kDebugMode) print(value.toString());
      setLoading(false);
      Utils.toastMessage("Successfully user created");
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.errorMessage(error.toString(), context);
    });
  }
}
