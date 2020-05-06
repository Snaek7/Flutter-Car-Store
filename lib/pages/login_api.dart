import 'dart:convert';

import 'package:first_app/pages/usuario.dart';
import 'package:first_app/utils/api_result.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(
      String login, String password) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';
    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {'username': login, 'password': password};

    String s = json.encode(params);
    print("$s");

    var response = await http.post(url, body: s, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      final user = Usuario.fromJson(mapResponse);
      return ApiResponse.ok(user);
    }

    return ApiResponse.error(mapResponse["error"]);
  }
}
