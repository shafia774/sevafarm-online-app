import 'fruitprod.dart';
import 'package:http/http.dart' as http;
Future<List<Fruitprod>> fetchFruitprod() async {
  var url = Uri.parse(
      "http://sevafarm-portal.000webhostapp.com/api/fruitprod.php");
  final response = await http.get(url);
  return fruitprodFromJson(response.body);
}
