import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/widgets/match_format_selector.dart';
import 'package:bonkbonk/widgets/match_participant_card.dart';
import 'package:flutter/services.dart';

class MatchCreationScreen extends StatefulWidget {
  const MatchCreationScreen({Key? key}) : super(key: key);

  @override
  State<MatchCreationScreen> createState() => _MatchCreationScreenState();
}

class _MatchCreationScreenState extends State<MatchCreationScreen> {
  MatchFormat? _format = MatchFormat.bestof1;
  int _firstOverallScore = 0;
  int _secondOverallScore = 0;
  Player? opponent;
  @override
  Widget build(BuildContext context) {
    Match match = Match(matchFormat: _format);
    for (var game in match.games) {
      game.firstPlayerController.addListener(() {
        _firstOverallScore = 0;
        _secondOverallScore = 0;
        for (var game in match.games) {
          if ((int.tryParse(game.firstPlayerController.text) ?? 0) >
              (int.tryParse(game.secondPlayerController.text) ?? 0)) {
            _firstOverallScore++;
          } else {
            _secondOverallScore++;
          }
        }
      });
      game.secondPlayerController.addListener(() {
        _firstOverallScore = 0;
        _secondOverallScore = 0;
        for (var game in match.games) {
          if ((int.tryParse(game.firstPlayerController.text) ?? 0) >
              (int.tryParse(game.secondPlayerController.text) ?? 0)) {
            setState(() {
              _firstOverallScore++;
            });
          } else {
            setState(() {});
          }
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавить матч"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MatchParticipantCard(
                player: user,
                canBePressed: false,
              ),
              SizedBox(
                width: 30,
              ),
              MatchParticipantCard(player: opponent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_firstOverallScore.toString()),
              Text(" - "),
              Text(_secondOverallScore.toString()),
            ],
          ),
          Column(
            children: <Widget>[
              RadioListTile<MatchFormat>(
                title: const Text('До 1 победы'),
                value: MatchFormat.bestof1,
                groupValue: _format,
                onChanged: (MatchFormat? value) {
                  setState(() {
                    _format = value;
                  });
                },
              ),
              RadioListTile<MatchFormat>(
                title: const Text('До 2 побед'),
                value: MatchFormat.bestof3,
                groupValue: _format,
                onChanged: (MatchFormat? value) {
                  setState(() {
                    _format = value;
                  });
                },
              ),
              RadioListTile<MatchFormat>(
                title: const Text('До 3 побед'),
                value: MatchFormat.bestof5,
                groupValue: _format,
                onChanged: (MatchFormat? value) {
                  setState(() {
                    _format = value;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: match.games.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Вы")),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      height: 55,
                      width: 40,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            counter: Text(""),
                            border: OutlineInputBorder()),
                        maxLength: 1,
                        controller: match.games[index].firstPlayerController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Text("-"),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      height: 55,
                      width: 40,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            counter: Text(""),
                            border: OutlineInputBorder()),
                        maxLength: 1,
                        controller: match.games[index].secondPlayerController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Text("Не вы"),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Match {
  MatchFormat? matchFormat;
  List<Game> games = [];
  Match({required this.matchFormat}) {
    matchFormat == MatchFormat.bestof1
        ? games.add(Game())
        : matchFormat == MatchFormat.bestof3
            ? games.addAll([Game(), Game()])
            : games.addAll([Game(), Game(), Game()]);
  }
}

class Game extends ChangeNotifier {
  int? _firstPlayerScore;
  TextEditingController _firstPlayerScoreController = TextEditingController();
  TextEditingController _secondPlayerScoreController = TextEditingController();
  TextEditingController get firstPlayerController =>
      _firstPlayerScoreController;
  TextEditingController get secondPlayerController =>
      _secondPlayerScoreController;
  int? _secondPlayerScore;
  int? get firstPlayerScore => _firstPlayerScore;
  int? get secondPlayerScore => _secondPlayerScore;

  set setFirstPlayerScore(int score) {
    _firstPlayerScore = score;
    notifyListeners();
  }

  set setSecondPlayerScore(int score) {
    _secondPlayerScore = score;
    notifyListeners();
  }
}
