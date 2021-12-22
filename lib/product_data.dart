import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class ProductData {
  late int? itemNum;
  late String? itemName;
  late double? itemPrice;
  // final jsondata = [
  //   {"itemNum": 0, "itemName": "Purepet", "itemPrice": 200.20},
  //   {"itemNum": 1, "itemName": "Pedigree", "itemPrice": 550.20},
  //   {"itemNum": 2, "itemName": "Drools", "itemPrice": 80.40},
  //   {"itemNum": 3, "itemName": "Drools", "itemPrice": 402.20},
  //   {"itemNum": 4, "itemName": "Supercoat", "itemPrice": 333.00},
  //   {"itemNum": 5, "itemName": "Iams", "itemPrice": 100.20},
  //   {"itemNum": 6, "itemName": "Royal Canin", "itemPrice": 200.20},
  //   {"itemNum": 7, "itemName": "Chappi", "itemPrice": 700.70},
  //   {"itemNum": 8, "itemName": "Meetup", "itemPrice": 345.60},
  //   {"itemNum": 9, "itemName": "Drools", "itemPrice": 235.80},
  //   {"itemNum": 10, "itemName": "Meetup", "itemPrice": 244.40},
  //   {"itemNum": 11, "itemName": "Pedigree", "itemPrice": 734.20},
  //   {"itemNum": 12, "itemName": "N&D", "itemPrice": 256.70},
  //   {"itemNum": 13, "itemName": "Pedigree", "itemPrice": 753.40},
  //   {"itemNum": 14, "itemName": "Meetup", "itemPrice": 634.60}
  // ];
  ProductData({this.itemNum, this.itemName, this.itemPrice});

  ProductData.fromJson(Map<String, dynamic> json) {
    itemNum = json['itemNum'];
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['itemNum'] = itemNum;
  //   data['itemName'] = itemName;
  //   data['itemPrice'] = itemPrice;
  //   return data;
  // }

  List<Widget> getProductData() {
    var parsedJson = json.decode('images/data.json');
    var productData = ProductData.fromJson(parsedJson);
    stdout.writeln(
        'The product name is ${productData.itemName} and its price is :${productData.itemPrice} with index ${productData.itemNum}');
    return [
      const Text('hiii'),
      const Text('hiii'),
      const Text('hiii'),
      const Text('hiii'),
      const Text('hiii'),
      const Text('hiii'),
      const Text('hiii'),
      const Text('hiii'),
    ];
  }
}
