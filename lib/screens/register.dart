import "package:bonkbonk/imports.dart";

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _surnameController = TextEditingController();
    TextEditingController _loginController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                label: Text("Логин"),
                hintText: "Придумайте логин",
              ),
            ),
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                label: Text("Имя"),
                hintText: "Придумайте логин",
              ),
            ),
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                label: Text("Фамилия"),
                hintText: "Придумайте логин",
              ),
            ),
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                label: Text("Логин"),
                hintText: "Придумайте логин",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
