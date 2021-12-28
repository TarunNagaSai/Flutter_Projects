import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Models/productdata.dart';

class SharedServices {
  static const String pList = 'productList';
  // Items adding to the ProductData
  static Future<bool> addItem(ProductData product) async {
    List<String> productList = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(pList)) {
      productList = preferences.getStringList(pList) ?? [];
      for (var prod in productList) {
        var pro = productDataFromJson(prod);
        if (product.itemNum == pro.itemNum) {
          pro.quantity += 1;
          var index = productList.indexOf(prod);
          productList.removeAt(index);
          productList.insert(index, productDataToJson(pro));
          return await preferences.setStringList(pList, productList);
        }
      }
      productList.add(productDataToJson(product));
      return await preferences.setStringList(pList, productList);
    } else {
      productList = [productDataToJson(product)];
      return await preferences.setStringList(pList, productList);
    }
  }

  static Future<List<ProductData>> getItems() async {
    List<ProductData> productData = [];
    List<String> data = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(pList)) {
      data = preferences.getStringList(pList) ?? [];
      for (var item in data) {
        productData.add(productDataFromJson(item));
      }
    }
    return productData;
  }

  static void clearCart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(pList)) {
      preferences.remove(pList);
    }
  }

  static void decreaseItem(ProductData product) async {
    List<String> productList = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(pList)) {
      productList = preferences.getStringList(pList) ?? [];
      for (var prod in productList) {
        var pro = productDataFromJson(prod);
        if (product.itemNum == pro.itemNum) {
          pro.quantity -= 1;
          var index = productList.indexOf(prod);
          productList.removeAt(index);
          if (pro.quantity == 0) {
            productList.remove(prod);
          } else {
            productList.insert(index, productDataToJson(pro));
          }
          await preferences.setStringList(pList, productList);
        }
      }
    }
  }

  static void deleteItem(ProductData product) async {
    List<String> productList = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(pList)) {
      productList = preferences.getStringList(pList) ?? [];
      for (var prod in productList) {
        var pro = productDataFromJson(prod);
        if (product.itemNum == pro.itemNum) {
          productList.remove(prod);
          await preferences.setStringList(pList, productList);
        }
      }
    }
  }
}
