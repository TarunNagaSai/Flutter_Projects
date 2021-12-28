import 'package:flutter/material.dart';
import 'package:shopping/Services/shared_services.dart';

import '../../Models/productdata.dart';

class ProductCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProductCard(this.product);

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/${product.itemNum}.jpg'),
                width: 100.0,
                height: 100.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              product.itemName,
              style: const TextStyle(fontSize: 22.0),
            ),
            Text(
              '${product.itemPrice}',
              // style: const TextStyle(fontSize: 22.0),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  SharedServices.addItem(product);
                  //SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('${product.itemName} is added to cart')),
                  );
                },
                child: const Text(
                  'add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
