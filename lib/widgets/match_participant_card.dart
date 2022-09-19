import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/screens/opponent_selection.dart';

class MatchParticipantCard extends StatefulWidget {
  MatchParticipantCard({
    Key? key,
    this.player,
    this.canBePressed = true,
  }) : super(key: key);
  Player? player;
  bool canBePressed;
  @override
  State<MatchParticipantCard> createState() => _MatchParticipantCardState();
}

class _MatchParticipantCardState extends State<MatchParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.canBePressed
          ? () async {
              widget.player = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OpponentSelectionScreen()));
              setState(() {});
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        width: 100,
        height: 100,
        child: Center(
          child: widget.player != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.player!.name!),
                    Text(widget.player!.surname!)
                  ],
                )
              : Icon(Icons.add),
        ),
      ),
    );
  }
}
