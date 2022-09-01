import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              userVM.removeUser().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.login, (_) => false);
              });
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
