import 'package:bonkbonk/http_repository.dart';
import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/models/player.dart';
import 'package:bonkbonk/screens/create_match.dart';
import 'package:bonkbonk/widgets/my_match_card.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  bool _isLoaded = false;
  @override
  void initState() {
    _isLoaded = false;
    _loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() async {
    await HttpRepository().loadMyMatches();
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MatchCreationScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Матчи"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return MyMatchCard();
            }, childCount: 5),
          )
        ],
      ),
      // ListView.builder(
      //   itemCount: players.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Text(players[index].name ?? "kek");
      //   },
      // ),
    );
  }
}
