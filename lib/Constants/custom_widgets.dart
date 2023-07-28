import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Models/cart_list_model.dart';
import 'package:flutter_demo_project/views/cart_details_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

Widget verticalSpace({required double height}) {
  return SizedBox(height: height);
}

Widget horizontalSpace({required double width}) {
  return SizedBox(width: width);
}

Widget appText(
    {required String text,
    int? maxLines,
    TextOverflow? textOverflow,
    Color? textColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    double? wordSpacing,
    FontStyle? fontStyle,
    FontWeight? fontWeight}) {
  return Text(
    text,
    overflow: textOverflow,
    maxLines: maxLines,
    style: GoogleFonts.roboto(
        color: textColor,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
        height: height,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing),
  );
}

Widget cartDeatilsCardWidget(
    {required String title,
    required String id,
    required String pricePerUnit,
    required String qty,
    required String discountPr,
    required String total}) {
  return Card(
    child: ListTile(
        title: appText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 0.86),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            appText(text: "Price: ", textColor: AppColors.grey),
            appText(text: pricePerUnit),
            horizontalSpace(width: 7),
            appText(text: "Qty: ", textColor: AppColors.grey),
            appText(text: qty),
            horizontalSpace(width: 7),
            appText(text: "Discount :", textColor: AppColors.grey),
            appText(text: "$discountPr%"),
          ],
        ),
        leading: CircleAvatar(child: appText(text: id)),
        trailing: appText(
            text: "\$$total", fontWeight: FontWeight.bold, fontSize: 16)),
  );
}

Widget cartCardWidget(
    {required String total,
    required String userId,
    required String id,
    required String totalProduct,
    required List<Product> productList,
    required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CartDetailsView(
                    productList: productList,
                  )));
    },
    child: Card(
      child: ListTile(
        title: appText(
            text: "Total: \$$total", fontSize: 16, fontWeight: FontWeight.bold),
        subtitle: appText(
            text: "UserId: $userId", fontSize: 14, fontWeight: FontWeight.w500),
        leading: CircleAvatar(child: appText(text: id)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 12,
              child: appText(text: totalProduct),
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    ),
  );
}
