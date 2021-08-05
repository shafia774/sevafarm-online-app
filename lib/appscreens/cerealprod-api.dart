import 'cerealprod.dart';
import 'package:http/http.dart' as http;
Future<List<Cerealprod>> fetchCerealprod() async {
  var url = Uri.parse(
      "http://sevafarm-portal.000webhostapp.com/api/cerealprod.php");
  final response = await http.get(url);
  return cerealprodFromJson(response.body);
}
