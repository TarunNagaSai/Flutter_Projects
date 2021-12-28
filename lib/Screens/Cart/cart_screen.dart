import 'package:flutter/material.dart';
import 'package:shopping/Services/shared_services.dart';
import 'package:shopping/Models/productdata.dart';
import 'package:shopping/Widgets/Cart/cart_product.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static String id = 'CartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    getProductdata();
  }

  List<ProductData> cartProduct = [];

  void getProductdata() async {
    List<ProductData> products = [];
    products = await SharedServices.getItems();
    setState(() {
      cartProduct = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cart Screen'),
        actions: [
          IconButton(
            onPressed: () {
              SharedServices.clearCart();
              setState(() {
                cartProduct = [];
              });
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: cartProduct.isEmpty
          ? Center(
              child: Column(
                children: const [
                  Image(
                    image: AssetImage('assets/empty5.png'),
                    height: 500.0,
                    width: 500.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Cart is Empty'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: cartProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return CartProduct(cartProduct[index], getProductdata);
              },
            ),
      bottomNavigationBar: TextButton(
        onPressed: () {},
        child: const Text(
          'Check Out',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
      ),
    );
  }
}
