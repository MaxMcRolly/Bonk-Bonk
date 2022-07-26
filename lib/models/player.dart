import "package:bonkbonk/imports.dart";

List<Player> players = [];

class Player {
  Player();

  String? username;
  int? id;
  String? name;
  String? surname;
  int? elo;
  Player._fromJson(Map<String, dynamic> player) {
    elo = player["elo"];
    name = player["first_name"];
    surname = player["last_name"];
    id = player["id"];
  }
  fromJson(List json) {
    players = [];
    for (Map<String, dynamic> player in json) {
      players.add(Player._fromJson(player));
    }
  }
}
