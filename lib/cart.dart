import 'package:flutter/material.dart';
// import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CartList extends StatefulWidget {
  const CartList({Key? key, required this.productData}) : super(key: key);
  final List<int> productData;

  // List<int> data = productData;
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final List<dynamic> _name = [];
  Future<void> getProductName(int productImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String productName = preferences.getString('$productImage') ?? "";
    setState(() {
      _name.insert(productImage, productName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: cartProductList(),
      bottomNavigationBar: TextButton(
        onPressed: () {
          setState(() {
            widget.productData.clear();
          });
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

  Widget cartProductList() {
    if (widget.productData.isEmpty) {
      return Center(
        child: Column(
          children: const [
            Image(
              image: AssetImage('images/empty5.png'),
              height: 500.0,
              width: 500.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Cart is Empty'),
          ],
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: widget.productData.length,
        itemBuilder: (BuildContext context, int index) {
          // int content = 1;
          // // List<int> content = [];
          // // content.add(1);
          int cartProductImage = widget.productData[index];
          getProductName(cartProductImage);
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
                        _name[cartProductImage],
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
                                    // setState(() {
                                    //   // --content;
                                    //   // stdout.writeln(content[index]);
                                    // });
                                  },
                                ),
                                const Text(
                                  '1',
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle,
                                    size: 20.0,
                                  ),
                                  onPressed: () {
                                    // setState(() {
                                    //   // ++content;
                                    //   // stdout.write(content[index]);
                                    // });
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
}
