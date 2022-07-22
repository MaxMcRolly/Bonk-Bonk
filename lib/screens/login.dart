import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _loginController = TextEditingController();

    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("bonk-bonk")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Логин"),
                ),
                controller: _loginController,
              ),
            ),
            Container(
              width: 200,
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Пароль"),
                ),
                controller: _passwordController,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Войти"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
              child: Text("Зарегистрироваться"),
            )
          ],
        ),
      ),
    );
  }
}
