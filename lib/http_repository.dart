import 'dart:convert';

import "imports.dart";
import "package:http/http.dart" as http;

class HttpRepository {
  HttpRepository();
  registerUser() async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/sign-up/";
    var response = await http.post(Uri.parse(url), body: user.toJson());
    print(response.body);
    print(response.statusCode);
  }

  Future<bool> loginUser(
      {required String login, required String password}) async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/login/";
    var response = await http.post(Uri.parse(url), headers: {
      "Authorization": "Basic ${base64.encode(utf8.encode("$login:$password"))}"
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body)["user"]);
      user.token = json.decode(response.body)["token"];
      return true;
    } else {
      return false;
    }
  }
}
