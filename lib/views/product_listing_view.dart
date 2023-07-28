import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Constants/app_colors.dart';
import 'package:flutter_demo_project/Constants/custom_widgets.dart';
import 'package:flutter_demo_project/providers/product_provider.dart';
import 'package:flutter_demo_project/views/cart_view.dart';
import 'package:flutter_demo_project/views/product_detail_view.dart';
import 'package:provider/provider.dart';

import '../Models/product_list_model.dart';

class ProductListingView extends StatefulWidget {
  const ProductListingView({super.key});

  @override
  State<ProductListingView> createState() => _ProductListingViewState();
}

class _ProductListingViewState extends State<ProductListingView> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getProuducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartView()));
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.black,
                size: 26,
              ),
            ),
          )
        ],
        backgroundColor: AppColors.blue.withOpacity(0.5),
        title: appText(
            text: "Product List", fontSize: 17, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: productProvider.isApiCall
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return verticalSpace(height: 6);
                        },
                        shrinkWrap: true,
                        itemCount:
                            productProvider.productList.products?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          Product product =
                              productProvider.productList.products![index];
                          return listingCard(
                              product: product,
                              size: size,
                              context: context,
                              imageUrl: product.thumbnail ?? "",
                              title: product.title ?? "",
                              description: product.description ?? "",
                              price: (product.price ?? 0).toString(),
                              discountPrice:
                                  (product.discountPercentage ?? 0).toString());
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

Widget listingCard(
    {required Size size,
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String description,
    required String price,
    required String discountPrice,
    required Product product}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsView(
                    prodct: product,
                  )));
    },
    child: Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: 150,
              fit: BoxFit.cover,
            ),
            horizontalSpace(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(
                      text: title,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1),
                  appText(
                      text: description,
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 2),
                  Row(
                    children: [
                      appText(text: "Price: ", textColor: AppColors.grey),
                      appText(text: "\$$price"),
                      horizontalSpace(width: 6),
                      appText(text: "Discount: ", textColor: AppColors.grey),
                      appText(text: "$discountPrice%")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
