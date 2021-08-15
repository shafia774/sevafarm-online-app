// To parse this JSON data, do
//
//     final pulseprod = pulseprodFromJson(jsonString);

import 'dart:convert';

List<Pulseprod> pulseprodFromJson(String str) => List<Pulseprod>.from(json.decode(str).map((x) => Pulseprod.fromJson(x)));

String pulseprodToJson(List<Pulseprod> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pulseprod {
  Pulseprod({
    this.product,
    this.quantity,
    this.price,
  });

  String product;
  String quantity;
  String price;

  factory Pulseprod.fromJson(Map<String, dynamic> json) => Pulseprod(
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
