import 'package:flutter/material.dart';
import 'package:shopping/Models/productdata.dart';
import 'package:shopping/Services/shared_services.dart';

class CartProduct extends StatelessWidget {
  const CartProduct(this.product, this.getProductIncerment, {Key? key})
      : super(key: key);

  final Function getProductIncerment;

  final ProductData product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image(
              image: AssetImage('assets/${product.itemNum}.jpg'),
            ),
          ),
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Text(
                  product.itemName,
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
                              SharedServices.decreaseItem(product);
                              getProductIncerment();
                            },
                          ),
                          Text(
                            "${product.quantity}",
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle,
                              size: 20.0,
                            ),
                            onPressed: () {
                              SharedServices.addItem(product);
                              getProductIncerment();
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
                        onPressed: () {
                          SharedServices.deleteItem(product);
                          getProductIncerment();
                        },
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
  }
}
