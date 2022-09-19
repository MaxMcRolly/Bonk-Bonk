import "package:bonkbonk/imports.dart";

class OpponentCard extends StatefulWidget {
  OpponentCard({
    Key? key,
    required this.opponent,
  }) : super(key: key);
  Player opponent;
  @override
  State<OpponentCard> createState() => _OpponentCardState();
}

class _OpponentCardState extends State<OpponentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, widget.opponent);
      },
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1)),
            width: 128,
            height: 128,
            child: Center(
              child: Icon(
                Icons.person_outline,
                size: 80,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "${widget.opponent.name}\n"),
                    TextSpan(text: "${widget.opponent.surname}"),
                  ],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "ELO: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "${widget.opponent.elo}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
