import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Models/cart_list_model.dart';

import '../Constants/app_colors.dart';
import '../Constants/custom_widgets.dart';

class CartDetailsView extends StatefulWidget {
  final List<Product> productList;
  const CartDetailsView({super.key, required this.productList});

  @override
  State<CartDetailsView> createState() => _CartDetailsViewState();
}

class _CartDetailsViewState extends State<CartDetailsView> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Length=> ${widget.productList.length}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue.withOpacity(0.5),
        title: appText(
            text: "Cart Details", fontSize: 17, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.productList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpace(height: 4);
                },
                itemBuilder: (BuildContext context, int index) {
                  Product product = widget.productList[index];
                  return cartDeatilsCardWidget(
                      title: product.title ?? "",
                      id: (product.id ?? 0).toString(),
                      pricePerUnit: (product.price ?? 0).toString(),
                      qty: (product.quantity ?? 0).toString(),
                      discountPr: (product.discountPercentage ?? 0.00)
                          .toStringAsFixed(2),
                      total: (product.discountedPrice ?? 0).toString());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

