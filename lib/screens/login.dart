import 'package:bonkbonk/http_repository.dart';
import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/screens/home.dart';
import 'package:bonkbonk/screens/register.dart';
import 'package:bonkbonk/widgets/logo.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("bonk-bonk")),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
            ),
            BonkLogo(),
            SizedBox(
              height: 50,
            ),
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
            SizedBox(
              height: 12,
            ),
            OutlinedButton(
              onPressed: () async {
                await HttpRepository().loginUser(
                  login: _loginController.text,
                  password: _passwordController.text,
                )
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()))
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Неверные логин/пароль")));
                // : showDialog(
                //     context: context,
                //     builder: ((context) => AlertDialog(
                //           title: Text('Неверные логин/пароль',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(fontSize: 16)),
                //           actions: [
                //             Center(
                //               child: ElevatedButton(
                //                   onPressed: () {
                //                     Navigator.pop(context);
                //                   },
                //                   child: Text("OK :(")),
                //             )
                //           ],
                //         )));
              },
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
