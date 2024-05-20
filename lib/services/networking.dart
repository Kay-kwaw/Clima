import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  // Constructor to initialize the NetworkHelper with a URL
  NetworkHelper(this.url);

  // The URL for the API endpoint
  //defines a constant variable url to store the URL for the API endpoint.
  final String url;

  Future getData() async {
    http.Response response = await http.get(url as Uri);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}