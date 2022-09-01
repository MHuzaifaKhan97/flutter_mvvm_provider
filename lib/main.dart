import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/res/color.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view_model/auth_view_model.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM',
        debugShowCheckedModeBanner: false,

        theme:
            ThemeData(appBarTheme: AppBarTheme(color: AppColors.primaryColor)),
        // home: const LoginScreen(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
