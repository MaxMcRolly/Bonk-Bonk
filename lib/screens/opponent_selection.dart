import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/widgets/opponent_card.dart';

class OpponentSelectionScreen extends StatefulWidget {
  const OpponentSelectionScreen({Key? key}) : super(key: key);

  @override
  State<OpponentSelectionScreen> createState() =>
      _OpponentSelectionScreenState();
}

class _OpponentSelectionScreenState extends State<OpponentSelectionScreen> {
  // bool _isLoaded=false;
  @override
  void initState() {
    //  _loadData();
    super.initState();
  }

  _loadData() async {
    await HttpRepository().loadAllPlayersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Выбрать оппонента"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    OpponentCard(
                      opponent: players[index],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        height: 0.0,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                );
              },
              childCount: players.length,
            ),
          ),
        ],
      ),
    );
  }
}
