import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.CheckAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 30, 30),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Splash Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Flutter with MVVM Architecture",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
