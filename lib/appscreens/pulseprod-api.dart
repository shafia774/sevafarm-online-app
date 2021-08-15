import 'pulseprod.dart';
import 'package:http/http.dart' as http;
Future<List<Pulseprod>> fetchPulseprod() async {
  var url = Uri.parse(
      "http://192.168.18.2/sevafarm/api/pulseprod.php");
  final response = await http.get(url);
  return pulseprodFromJson(response.body);
}
