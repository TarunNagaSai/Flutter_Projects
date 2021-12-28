import 'package:flutter/material.dart';
import 'package:shopping/Screens/Cart/cart_screen.dart';
import 'package:shopping/Screens/Home/home_screen.dart';
import 'package:shopping/Screens/Login/login_screen.dart';
import 'package:shopping/Services/login_services.dart';

void main() {
  runApp(const Shopping());
}

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  bool checkLogin = false;

  @override
  void initState() {
    super.initState();
    directPage();
  }

  void directPage() async {
    bool check = false;
    check = await LoginServices.checkLoginDetails();
    setState(() {
      checkLogin = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: checkLogin ? LoginScreen.id : HomePage.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        HomePage.id: (context) => const HomePage(),
        CartScreen.id: (context) => const CartScreen(),
      },
    );
  }
}
