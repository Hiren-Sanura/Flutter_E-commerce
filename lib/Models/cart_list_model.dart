// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
    List<Cart>? carts;
    int? total;
    int? skip;
    int? limit;

    CartListModel({
        this.carts,
        this.total,
        this.skip,
        this.limit,
    });

    factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        carts: json["carts"] == null ? [] : List<Cart>.from(json["carts"]!.map((x) => Cart.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "carts": carts == null ? [] : List<dynamic>.from(carts!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Cart {
    int? id;
    List<Product>? products;
    int? total;
    int? discountedTotal;
    int? userId;
    int? totalProducts;
    int? totalQuantity;

    Cart({
        this.id,
        this.products,
        this.total,
        this.discountedTotal,
        this.userId,
        this.totalProducts,
        this.totalQuantity,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
    };
}

class Product {
    int? id;
    String? title;
    int? price;
    int? quantity;
    int? total;
    double? discountPercentage;
    int? discountedPrice;

    Product({
        this.id,
        this.title,
        this.price,
        this.quantity,
        this.total,
        this.discountPercentage,
        this.discountedPrice,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedPrice: json["discountedPrice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
    };
}
