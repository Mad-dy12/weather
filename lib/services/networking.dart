import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

class NetworkHelper {
  late final String url;

  NetworkHelper({required this.url});

  Future<dynamic> getResponseData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
