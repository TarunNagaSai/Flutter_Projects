// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopping/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product_data.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

ProductData productData = ProductData();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  List<int> data = [];

  List<dynamic> productdata = [];

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString('images/data.json');
    setState(() {
      productdata = json.decode(jsonText);
    });
  }

  List<Widget> jsonData() {
    List<Widget> rawData = [];
    for (var i in productdata) {
      rawData.add(items(
          itemNum: i["itemNum"], name: i["itemName"], price: i["itemPrice"]));
    }
    return rawData;
  }

// Items card
  Card items(
      {required int itemNum, required String name, required double price}) {
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
              name,
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
                  preferences.setString('$itemNum', name);

                  //SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name is added to cart')),
                  );

                  //send item num to data list
                  data.add(itemNum);
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
                  return CartList(
                    productData: data,
                  );
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
        children: jsonData(),
      ),
    );
  }
}
