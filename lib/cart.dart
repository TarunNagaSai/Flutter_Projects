import 'package:flutter/material.dart';
import 'package:shopping/cart_products.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

CartProduct cartProduct = CartProduct();

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List productList = cartProduct.sendProduct();

  Future<String?> getProductName(int productImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? status = preferences.getString('$productImage');
    return status;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            List<int> content = [];
            content[index] = 0;
            int cartProductImage = cartProduct.getItemNum(index);
            String cartProductName = getProductName(cartProductImage) as String;
            return Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(
                      image: AssetImage('images/$cartProductImage.jpg'),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        Text(
                          cartProductName,
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        const Text(
                          'This is a dog food Product',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.do_disturb_on,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        content[index]--;
                                      });
                                    },
                                  ),
                                  Text('$context[index]'),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        content[index]++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  size: 20.0,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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
