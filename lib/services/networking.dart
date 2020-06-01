import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({this.url});

  String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('404');
    }
  }
}