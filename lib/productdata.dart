class ProductData {
  int? itemNum;
  String? itemName;
  double? itemPrice;

  ProductData({this.itemNum, this.itemName, this.itemPrice});

  ProductData.fromJson(Map<String, dynamic> json) {
    itemNum = json['itemNum'];
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemNum'] = itemNum;
    data['itemName'] = itemName;
    data['itemPrice'] = itemPrice;
    return data;
  }
}
