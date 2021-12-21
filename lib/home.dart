// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopping/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> data = [];
// Items card
  Card items({int? itemNum, String? name, double? price}) {
    // stdout.write('$itemNum,$name,$price');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage('images/$itemNum.jpg'),
                width: 100.0,
                height: 100.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '$name',
              style: const TextStyle(fontSize: 22.0),
            ),
            Text(
              '$price',
              // style: const TextStyle(fontSize: 22.0),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  //Push data to cart using Shared_Preferences
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setString('$itemNum', name!);

                  //SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name is added to cart')),
                  );

                  //send item num to data list
                  data.add(itemNum!);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // Go to cart Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CartList(productData: data,);
                }),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: (1.0 / 1.2),
        children: [
          items(itemNum: 0, name: 'Purepet', price: 200.20),
          items(itemNum: 1, name: 'Pedigree', price: 550.20),
          items(itemNum: 2, name: 'Drools', price: 80.40),
          items(itemNum: 3, name: 'Drools', price: 402.20),
          items(itemNum: 4, name: 'Supercoat', price: 333.00),
          items(itemNum: 5, name: 'Iams', price: 100.20),
          items(itemNum: 6, name: 'Royal Canin', price: 200.20),
          items(itemNum: 7, name: 'Chappi', price: 700.70),
          items(itemNum: 8, name: 'Meetup', price: 345.60),
          items(itemNum: 9, name: 'Drools', price: 235.80),
          items(itemNum: 10, name: 'Meetup', price: 244.40),
          items(itemNum: 11, name: 'Pedigree', price: 734.20),
          items(itemNum: 12, name: 'N&D', price: 256.70),
          items(itemNum: 13, name: 'Pedigree', price: 753.40),
          items(itemNum: 14, name: 'Meetup', price: 634.60),
        ],
      ),
    );
  }
}
