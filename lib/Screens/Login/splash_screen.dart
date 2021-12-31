import 'package:flutter/material.dart';
import 'package:shopping/Helper/routes.dart';
import 'package:shopping/Services/login_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    var checkLogin = await LoginServices.checkLoginDetails();
    if (checkLogin == true) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route)=> false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route)=> false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Icon-512.png'),
      ),
    );
  }
}
