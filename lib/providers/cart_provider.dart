import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Models/cart_list_model.dart';

import '../Constants/api_urls.dart';
import '../Networking/api_handler.dart';

class CartProvider extends ChangeNotifier {
  bool isApiCall = false;
  CartListModel cartList = CartListModel();
  getCartData() async {
    isApiCall = true;
    var response = await Networking.getApi(url: APIUrl.cartList);
    isApiCall = false;
    if (response.statusCode == 200) {
      cartList = cartListModelFromJson(response.body);
      debugPrint("Cart==> ${cartList.carts?.length ?? 0}");
    }
    notifyListeners();
  }
}
