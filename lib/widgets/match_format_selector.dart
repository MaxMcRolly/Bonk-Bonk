import "package:bonkbonk/imports.dart";

enum MatchFormat { bestof1, bestof3, bestof5 }

class MatchFormatSelector extends StatefulWidget {
  MatchFormatSelector({Key? key, required this.format}) : super(key: key);
  MatchFormat? format;
  @override
  _MatchFormatSelectorState createState() => _MatchFormatSelectorState();
}

class _MatchFormatSelectorState extends State<MatchFormatSelector> {
  // MatchFormat? _format = MatchFormat.bestof1;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<MatchFormat>(
          title: const Text('До 1 победы'),
          value: MatchFormat.bestof1,
          groupValue: widget.format,
          onChanged: (MatchFormat? value) {
            setState(() {
              widget.format = value;
            });
          },
        ),
        RadioListTile<MatchFormat>(
          title: const Text('До 2 побед'),
          value: MatchFormat.bestof3,
          groupValue: widget.format,
          onChanged: (MatchFormat? value) {
            setState(() {
              widget.format = value;
            });
          },
        ),
        RadioListTile<MatchFormat>(
          title: const Text('До 3 побед'),
          value: MatchFormat.bestof5,
          groupValue: widget.format,
          onChanged: (MatchFormat? value) {
            setState(() {
              widget.format = value;
            });
          },
        ),
      ],
    );
  }
}
