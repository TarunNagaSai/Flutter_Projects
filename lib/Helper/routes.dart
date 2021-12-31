// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shopping/Screens/Cart/cart_screen.dart';
import 'package:shopping/Screens/Home/home_screen.dart';
import 'package:shopping/Screens/Login/login_screen.dart';
import 'package:shopping/Screens/Login/splash_screen.dart';

class Routes {
  static get routes => <String, WidgetBuilder>{
    splash: (context) => const SplashScreen(),
    home: (context) => const HomePage(),
    login: (context) => const LoginScreen(),
    cart: (context) => const CartScreen(),
  };
  static const splash = '/';
  static const home = '/home';
  static const login = '/login';
  static const cart = '/cart';
}

// class Routes {
//   static get routes => <String, WidgetBuilder>{
//         splash: (context) => SplashScreen(),
//         about: (context) => AboutUs(),
//         onBoarding: (context) => OnBoardingPage(),
//         welcome: (context) => WelcomePage(),
//    static const about = '/about';
//   static const userResolvedRequest = '/userResolvedRequest';
//   static const sOSCallPage = '/sOSCallPage';
//   // static const requestHostel = '/requestHostel';
//   static const surveyHostel = '/surveyHostel';
//   }s