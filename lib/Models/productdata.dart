import 'dart:convert';

ProductData productDataFromJson(String str) {
  return ProductData.fromJson(json.decode(str));
}

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    required this.itemNum,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });

  late int itemNum;
  late String itemName;
  late double itemPrice;
  late int quantity;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        itemNum: json["itemNum"],
        itemName: json["itemName"],
        itemPrice: json["itemPrice"].toDouble(),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        "itemNum": itemNum,
        "itemName": itemName,
        "itemPrice": itemPrice,
        "quantity": quantity,
      };
}
