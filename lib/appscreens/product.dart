// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.product,
    this.quantity,
    this.price,
  });

  String product;
  String quantity;
  String price;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    product: json["product"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "quantity": quantity,
    "price": price,
  };
}
