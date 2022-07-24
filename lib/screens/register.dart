import 'package:bonkbonk/http_repository.dart';
import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/widgets/logo.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _currentStep = 0;
  bool _isCompleted = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.addListener(() {
      setState(() {
        _isCurrentStepComplete();
      });
    });
    _nameController.addListener(() {
      setState(() {
        _isCurrentStepComplete();
      });
    });
    _surnameController.addListener(() {
      setState(() {
        _isCurrentStepComplete();
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _isCurrentStepComplete();
      });
    });
    _confirmPasswordController.addListener(() {
      setState(() {
        _isCurrentStepComplete();
      });
    });
  }

  bool _isCurrentStepComplete() {
    if (_currentStep == 0) {
      return _loginController.text.isNotEmpty;
    } else if (_currentStep == 1) {
      return _surnameController.text.isNotEmpty &&
          _nameController.text.isNotEmpty;
    } else if (_currentStep == 2) {
      return _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text == _passwordController.text;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Регистрация"),
        ),
        body: _isCompleted
            ? Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    BonkLogo(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Регистрация завершена успешно",
                      // "You're ready to bonk",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("I'm ready to bonk!"),
                    )
                  ],
                ),
              )
            : Stepper(
                physics: NeverScrollableScrollPhysics(),
                onStepTapped: null,
                onStepContinue: _isCurrentStepComplete()
                    ? () {
                        if (_currentStep == getSteps().length - 1) {
                          user.name = _nameController.text;
                          user.surname = _surnameController.text;
                          user.password = _passwordController.text;
                          user.username = _loginController.text;
                          user.confirmPassword =
                              _confirmPasswordController.text;
                          user.password = _passwordController.text;
                          HttpRepository().registerUser();
                          setState(() {
                            _isCompleted = true;
                          });
                        } else {
                          setState(() {
                            _currentStep += 1;
                          });
                        }
                      }
                    : () {},
                onStepCancel: () {
                  setState(() {
                    _currentStep != 0 ? _currentStep -= 1 : null;
                  });
                },
                currentStep: _currentStep,
                type: StepperType.horizontal,
                controlsBuilder: ((context, details) {
                  bool _isLastStep = _currentStep == getSteps().length - 1;
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: _isCurrentStepComplete()
                                  ? Colors.green
                                  : Colors.grey),
                          onPressed: details.onStepContinue,
                          child: Text(_isLastStep ? "Завершить" : 'Продолжить'),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      if (_currentStep >= 1)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: Text('Назад'),
                          ),
                        ),
                    ]),
                  );
                }),
                steps: getSteps(),
              ));
  }

  List<Step> getSteps() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text("Логин"),
        content: Container(
          width: 200,
          child: TextFormField(
            controller: _loginController,
            decoration: InputDecoration(
                label: Text("Логин"),
                hintText: "Придумайте логин",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        ),
      ),
      Step(
          isActive: _currentStep >= 1,
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text("Имя"),
          content: Column(
            children: [
              Text(
                  "Введите ваши имя и фамилию, чтобы другие игроки могли вас найти"),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text("Имя"),
                  hintText: "Введите ваше имя",
                ),
              ),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(
                  label: Text("Фамилия"),
                  hintText: "Введите вашу фамилию",
                ),
              ),
            ],
          )),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text("Пароль"),
        content: Column(
          children: [
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text("Пароль"),
                hintText: "Придумайте пароль",
              ),
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                label: Text("Повторите пароль"),
              ),
            ),
          ],
        ),
      ),
      // Step(
      //   title: Text("Аватарка"),
      //   content: Container(),
      // ),
    ];
  }
}
