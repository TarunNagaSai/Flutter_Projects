import 'dart:io';

class CartProduct {
  late List<int> _productNum = [];

  setItemNum(int productNum) {
    _productNum.add(productNum);
    stdout.write(_productNum);
  }

  int getItemNum(int index) {
    return _productNum[index];
  }

  List sendProduct() {
    stdout.write(_productNum);
    return _productNum;
  }
}
