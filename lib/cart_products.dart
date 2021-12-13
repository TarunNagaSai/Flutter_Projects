class CartProduct {
  final List<int> _productNum = [];

  setItemNum(int productNum) {
    _productNum.add(productNum);
  }

  int getItemNum(int index) {
    return _productNum[index];
  }

  List sendProduct() {
    return _productNum;
  }
}
