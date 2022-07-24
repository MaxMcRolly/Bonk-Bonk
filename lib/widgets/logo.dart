import "package:bonkbonk/imports.dart";

class BonkLogo extends StatelessWidget {
  const BonkLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sports_tennis_sharp,
          size: 70,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Bonk\n"),
              TextSpan(text: "Bonk"),
            ],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
