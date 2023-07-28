import 'package:flutter/material.dart';
import 'package:flutter_demo_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../Constants/app_colors.dart';
import '../Constants/custom_widgets.dart';
import '../Models/cart_list_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue.withOpacity(0.5),
        title: appText(text: "Cart", fontSize: 17, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cartProvider.isApiCall
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return verticalSpace(height: 4);
                        },
                        shrinkWrap: true,
                        itemCount: cartProvider.cartList.carts?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          Cart cart = cartProvider.cartList.carts![index];
                          return cartCardWidget(
                              context: context,
                              productList: cart.products ?? <Product>[],
                              total: (cart.total ?? 0).toString(),
                              userId: (cart.userId ?? 0).toString(),
                              id: (cart.id ?? 0).toString(),
                              totalProduct:
                                  (cart.products?.length ?? 0).toString());
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
