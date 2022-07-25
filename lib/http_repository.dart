import 'dart:convert';

import 'package:bonkbonk/main.dart';

import "imports.dart";
import "package:http/http.dart" as http;

class HttpRepository {
  HttpRepository();
  Future registerUser() async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/sign-up/";
    var response = await http.post(Uri.parse(url), body: user.toJson());
    print(response.body);
    print(response.statusCode);
    // if (response.statusCode == 201) {
    //   return true;
    // } else {
    //   return false;
    // }
    return response;
  }

  // Future<bool> loginUser(
  Future loginUser({required String login, required String password}) async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/login/";
    var response = await http.post(Uri.parse(url), headers: {
      "Authorization": "Basic ${base64.encode(utf8.encode("$login:$password"))}"
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body)["user"]);
      authToken = json.decode(response.body)["token"];
      localStorage.setString("token", authToken!);
      // return true;
    } else {
      // return false;
    }
    return response;
  }

  getUserData() async {
    String url = "https://bonk-bonk.herokuapp.com/api/user/";
    var response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Token ${authToken}"});
    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body));
    }
    print(response.body);
    print(response.statusCode);
  }

  Future<bool> checkLoginAvailability({required String username}) async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/check-username/";
    var response =
        await http.post(Uri.parse(url), body: {"username": username});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
