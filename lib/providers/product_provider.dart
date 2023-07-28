import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Constants/api_urls.dart';
import 'package:flutter_demo_project/Models/product_list_model.dart';
import 'package:flutter_demo_project/Networking/api_handler.dart';

class ProductProvider extends ChangeNotifier {
  ProductListModel productList = ProductListModel();
  bool isApiCall = false;
  getProuducts() async {
    isApiCall = true;
    var response = await Networking.getApi(url: APIUrl.productList);
    isApiCall = false;
    if (response.statusCode == 200) {
      productList = productListModelFromJson(response.body);
      debugPrint("Products==> ${productList.products?.length ?? 0}");
    }
    notifyListeners();
  }
}
