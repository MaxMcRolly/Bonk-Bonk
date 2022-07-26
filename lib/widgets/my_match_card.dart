import "package:bonkbonk/imports.dart";

class MyMatchCard extends StatefulWidget {
  const MyMatchCard({Key? key}) : super(key: key);

  @override
  State<MyMatchCard> createState() => _MyMatchCardState();
}

class _MyMatchCardState extends State<MyMatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: EdgeInsets.only(top: 4, bottom: 6, left: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 0.5)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 0.5),
              color: Color(0xffe6e3e2)),
          width: 48,
          height: 48,
          child: Center(
            child: Icon(
              Icons.person_outline,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: 160,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "${user.name}123123123\n"),
                TextSpan(text: "${user.surname}123123123"),
              ],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          width: 64,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "2",
                  ),
                  TextSpan(text: " - "),
                  TextSpan(text: "1"),
                ],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            if (true)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "12",
                    ),
                    TextSpan(text: "-"),
                    TextSpan(text: "7"),
                  ],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
          ],
        ),
      ]),
    );
  }
}
