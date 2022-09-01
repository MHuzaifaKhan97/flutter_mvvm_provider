import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/repository/auth_repository.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utils/utils.dart';

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
