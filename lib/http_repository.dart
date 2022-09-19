import 'dart:convert';

import 'package:bonkbonk/main.dart';
import 'package:bonkbonk/models/player.dart';

import "imports.dart";
import "package:http/http.dart" as http;

class HttpRepository {
  HttpRepository();
  Future<String?> registerUser() async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/sign-up/";
    var response = await http.post(Uri.parse(url), body: user.toJson());
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return null;
    } else {
      return "${response.statusCode}: ${response.body}";
    }
  }

  // Future<bool> loginUser(
  Future<String?> loginUser(
      {required String login, required String password}) async {
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
      localStorage.setString(
          "expiration", json.decode(response.body)["expiry"]);
      return null;
    } else if (response.statusCode == 401) {
      return "Неверный логин или пароль";
    } else {
      return "${response.statusCode}: ${response.body}";
    }
  }

  Future<bool> refreshToken() async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/login/";
    var response = await http
        .post(Uri.parse(url), headers: {"Authorization": "Token ${authToken}"});
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body)["user"]);
      authToken = json.decode(response.body)["token"];
      localStorage.setString("token", authToken!);
      localStorage.setString(
          "expiration", json.decode(response.body)["expiry"]);
      return true;
    } else {
      return false;
    }
  }

  Future<String?> logoutUser() async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/logout/";
    var response = await http.post(
      Uri.parse(url),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body)["user"]);
      authToken = json.decode(response.body)["token"];
      localStorage.setString("token", authToken!);
      return null;
    } else if (response.statusCode == 401) {
      return "Неверный логин или пароль";
    } else {
      return "${response.statusCode}: ${response.body}";
    }
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

  Future<String?> checkLoginAvailability({required String username}) async {
    String url = "https://bonk-bonk.herokuapp.com/api/auth/check-username/";
    var response =
        await http.post(Uri.parse(url), body: {"username": username});
    if (response.statusCode == 200) {
      return null;
    } else {
      return "Этот логин занят. Выберите, пожалуйста, другой.";
    }
  }

  Future<String?> loadAllPlayersList() async {
    String url = "https://bonk-bonk.herokuapp.com/api/users/";
    var response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Token ${authToken}"});
    print(response.statusCode);
    print(response.body);
    print(authToken);
    if (response.statusCode == 200) {
      Player().fromJson(json.decode(utf8.decode(response.bodyBytes)) as List);
      return null;
    } else {
      return "${response.statusCode}: ${response.body}";
    }
  }

  Future loadMyMatches() async {
    String url = "https://bonk-bonk.herokuapp.com/api/matches/";
    var response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Token ${authToken}"});
    print(response.statusCode);
    print(response.body);
    // if (response.statusCode == 200) {
    //   Player().fromJson(json.decode(utf8.decode(response.bodyBytes)) as List);
    //   return null;
    // } else {
    //   return "${response.statusCode}: ${response.body}";
    // }
  }
}
