import "package:bonkbonk/imports.dart";

User user = User();
String? authToken;

class User extends Player {
  late String? password;
  late String? token;
  User();
  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    name = json["first_name"];
    surname = json["last_name"];
    elo = json["elo"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["first_name"] = name;
    json["last_name"] = surname;
    json["password"] = password;
    return json;
  }
}
