import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Text("Click Me"),
          onTap: () {
            // Utils.toastMessage("No Internet Connection");
            Utils.snackbar("No Internet Connection", context);
          },
        ),
      ),
    );
  }
}
