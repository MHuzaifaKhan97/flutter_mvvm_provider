import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      theme: ThemeData(),
      // home: const LoginScreen(),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
