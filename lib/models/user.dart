import "package:bonkbonk/imports.dart";

User user = User();

class User {
  late String? username;
  late String? name;

  late String? surname;
  late String? password;
  late String? confirmPassword;
  User();
  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    name = json["first_name"];
    surname = json["last_name"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["first_name"] = name;
    json["last_name"] = surname;
    json["password1"] = password;
    json["password2"] = confirmPassword;
    return json;
  }
}