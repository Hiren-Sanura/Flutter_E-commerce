import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Constants/app_colors.dart';
import 'package:flutter_demo_project/Constants/custom_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Models/product_list_model.dart';

class ProductDetailsView extends StatefulWidget {
  final Product prodct;
  const ProductDetailsView({super.key, required this.prodct});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue.withOpacity(0.5),
        title: appText(
            text: widget.prodct.title ?? "",
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageSlider(imageList: widget.prodct.images ?? []),
            verticalSpace(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                          text: widget.prodct.title ?? "",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      verticalSpace(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          appText(
                              text: "Brand: ",
                              fontSize: 16,
                              textColor: AppColors.grey,
                              fontWeight: FontWeight.w700),
                          appText(
                              text: widget.prodct.brand ?? "",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        appText(
                            text: "Price: ",
                            fontSize: 16,
                            textColor: AppColors.grey,
                            fontWeight: FontWeight.w700),
                        appText(
                            text: "\$${widget.prodct.price ?? 0}",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ],
                    ))
              ],
            ),
            verticalSpace(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                appText(
                    text: "Category: ",
                    fontSize: 16,
                    textColor: AppColors.grey,
                    fontWeight: FontWeight.w700),
                appText(
                    text: widget.prodct.category ?? "",
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ],
            ),
            verticalSpace(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        appText(
                            text: "Stock: ",
                            fontSize: 16,
                            textColor: AppColors.grey,
                            fontWeight: FontWeight.w700),
                        appText(
                            text: "${widget.prodct.stock ?? 0}",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        appText(
                            text: "Rating: ",
                            fontSize: 16,
                            textColor: AppColors.grey,
                            fontWeight: FontWeight.w700),
                        appText(
                            text: "${widget.prodct.rating ?? 0.0}",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ],
                    )),
              ],
            ),
            verticalSpace(height: 4),
            const Divider(height: 2),
            verticalSpace(height: 4),
            appText(
                text: "Description",
                fontSize: 14,
                textColor: AppColors.grey,
                fontWeight: FontWeight.w500),
            verticalSpace(height: 6),
            appText(
                text: widget.prodct.description ?? "",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic)
          ],
        ),
      ),
    );
  }
}

imageSlider({required List<String> imageList}) {
  return CarouselSlider.builder(
    itemCount: imageList.length,
    itemBuilder: (context, index, realIndex) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(imageList[index]));
    },
    options: CarouselOptions(
      autoPlay: true,
      viewportFraction: 0.80,
      enlargeCenterPage: true,
      enableInfiniteScroll: true,
      pageSnapping: true,
      autoPlayInterval: const Duration(seconds: 4),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.easeInOut,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index, reason) {},
    ),
  );
}
