import 'package:sevafarm_app/appscreens/auth.dart';
import 'package:intl/intl.dart';

import 'fruitprod.dart';
import 'package:http/http.dart' as http;

Future<List<Fruitprod>> placeOrder({product,quantity}) async {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  String string = dateFormat.format(DateTime.now());
  Auth user = new Auth();

  var url = Uri.parse(
      "http://192.168.18.2/sevafarm/api/order.php");

  final response = await http.post(url,body: {
    'product':product,
    'quantity': quantity,
    'customerid':user.username,
    'ordertime': string

  });

  //return fruitprodFromJson(response.body);
}
