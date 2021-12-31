import 'package:flutter/material.dart';
import 'package:shopping/Helper/constant.dart';
import 'package:shopping/Helper/routes.dart';
import 'package:shopping/Screens/Cart/cart_screen.dart';
import 'package:shopping/Services/login_services.dart';
import 'package:shopping/Widgets/Home/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'Home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              LoginServices.clearCredentials();
              Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: (1.0 / 1.2),
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(Constants.productData[index]);
        },
        itemCount: Constants.productData.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Go to cart Page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
