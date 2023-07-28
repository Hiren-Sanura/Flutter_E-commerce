import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Networking {
  static Future<Response> getApi({required String url}) async {
    Response response = await http.get(Uri.parse(url));
    return response;
  }
}
