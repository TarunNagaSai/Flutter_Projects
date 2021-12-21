import 'dart:io';

class CartProduct {
  final List<int> _productNum = [10,2,5,7,1];

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
