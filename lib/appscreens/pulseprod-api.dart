import 'pulseprod.dart';
import 'package:http/http.dart' as http;
Future<List<Pulseprod>> fetchPulseprod() async {
  var url = Uri.parse(
      "http://sevafarm-portal.000webhostapp.com/api/pulseprod.php");
  final response = await http.get(url);
  return pulseprodFromJson(response.body);
}
