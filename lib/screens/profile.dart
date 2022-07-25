import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Профиль"),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<PageViewCubit>().changeCurrentIndex(0);
                  authToken = null;
                  localStorage.remove("token");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
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
                            TextSpan(text: "${user.name}\n"),
                            TextSpan(text: "${user.surname}"),
                          ],
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: "ELO: ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "${user.elo}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
