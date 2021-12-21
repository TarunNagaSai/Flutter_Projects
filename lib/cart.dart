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

  Future<String> getProductName(int productImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? productName = preferences.getString('$productImage');
    stdout.write('productName:$productName');
    return productName.toString();
  }

  // Future<Widget> isCartEmpty()  async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   bool status = preferences.getBool('isCartEmpty') ?? false;
  //   return status ? emptyCart: cartProductList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: cartProductList(),
      bottomNavigationBar: TextButton(
        onPressed: () {
          stdout.write(productList);
        },
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

  Widget emptyCart() => const Center(
        child: Text(
          'Cart is empty.',
        ),
      );

  ListView cartProductList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        // int content = 1;
        List<int> content = [];
        if (content.length < productList.length) {
          content.add(1);
        }
        int cartProductImage = cartProduct.getItemNum(index);
        String cartProductName = getProductName(cartProductImage).toString();
        // stdout.write(cartProductName);
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
                                    stdout.write(content[index]);
                                  });
                                },
                              ),
                              Text('data'),
                              IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    content[index]++;
                                    stdout.write(content[index]);
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
    );
  }
}
