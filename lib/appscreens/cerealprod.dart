// To parse this JSON data, do
//
//     final cerealprod = cerealprodFromJson(jsonString);

import 'dart:convert';

List<Cerealprod> cerealprodFromJson(String str) => List<Cerealprod>.from(json.decode(str).map((x) => Cerealprod.fromJson(x)));

String cerealprodToJson(List<Cerealprod> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cerealprod {
  Cerealprod({
    this.product,
    this.quantity,
    this.price,
  });

  String product;
  String quantity;
  String price;

  factory Cerealprod.fromJson(Map<String, dynamic> json) => Cerealprod(
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
