import 'package:clima_flutter/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String responseData = response.body;
      var decodedData = jsonDecode(responseData);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
