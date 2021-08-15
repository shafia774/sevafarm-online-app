import 'dart:convert';

List<Fruitprod> fruitprodFromJson(String str) => List<Fruitprod>.from(json.decode(str).map((x) => Fruitprod.fromJson(x)));

String fruitprodToJson(List<Fruitprod> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fruitprod {
  Fruitprod({
    this.product,
    this.quantity,
    this.price,
  });

  String product;
  String quantity;
  String price;

  factory Fruitprod.fromJson(Map<String, dynamic> json) => Fruitprod(
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
