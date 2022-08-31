import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/res/components/round_button.dart';
import 'package:flutter_mvvm_provider/utils/utils.dart';
import 'package:flutter_mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: _emailNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    label: Text("Enter Email"),
                    hintText: "Enter email",
                    prefixIcon: Icon(Icons.email)),
                onFieldSubmitted: (val) {
                  Utils.fieldFocusChanged(context, _emailNode, _passwordNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordNode,
                    obscureText: _obscurePassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      label: Text("Enter Password"),
                      hintText: "Enter password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child: Icon(_obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined)),
                    ),
                  );
                },
              ),
              SizedBox(height: height * 0.085),
              RoundButton(
                title: "Login",
                loading: _authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.errorMessage("Please enter email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.errorMessage("Please enter password", context);
                  } else if (_passwordController.text.length < 8) {
                    Utils.errorMessage(
                        "Password length must be greater than 8", context);
                  } else {
                    Map data = {
                      'email': _emailController.text,
                      'password': _passwordController.text
                    };
                    _authViewModel.loginApi(data, context);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
