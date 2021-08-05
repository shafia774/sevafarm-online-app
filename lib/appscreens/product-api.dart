import 'product.dart';
import 'package:http/http.dart' as http;
Future<List<Products>> fetchProducts() async{
  var url = Uri.parse("http://sevafarm-portal.000webhostapp.com/api/products.php");
  final response = await http.get(url);
  return productsFromJson(response.body);
}
