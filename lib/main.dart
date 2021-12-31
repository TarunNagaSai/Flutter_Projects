// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping/Helper/routes.dart';

void main() {
  runApp(const Shopping());
}
class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:Routes.routes,
    );
  }
}

// class Shopping extends StatelessWidget {
//   const Shopping({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }