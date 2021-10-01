import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String authority;
  String unEncodedPath;
  Map<String, dynamic>? parameters;

  NetworkHelper(
      {required this.authority, required this.unEncodedPath, this.parameters});

  Future getData() async {
    Uri url = Uri.https(authority, unEncodedPath, parameters);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
