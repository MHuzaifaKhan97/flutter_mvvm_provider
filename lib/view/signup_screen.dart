import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/res/components/round_button.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utils/utils.dart';
import 'package:flutter_mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.text = "eve.holt@reqres.in";
    _passwordController.text = "pistol";
  }

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
          title: const Text("Sign Up"),
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
                title: "Register",
                loading: _authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.errorMessage("Please enter email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.errorMessage("Please enter password", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.errorMessage(
                        "Password length must be greater than 6", context);
                  } else {
                    Map data = {
                      'email': _emailController.text,
                      'password': _passwordController.text
                    };
                    _authViewModel.registerAPI(data, context);
                  }
                },
              ),
              const SizedBox(height: 16),
              RoundButton(
                title: "Login",
                inverse: true,
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
              ),
            ],
          ),
        ));
  }
}
