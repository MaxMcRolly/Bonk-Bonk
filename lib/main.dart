import 'package:bonkbonk/http_repository.dart';
import 'package:bonkbonk/logic/opponent/opponent_cubit.dart';
import 'package:bonkbonk/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "imports.dart";

late SharedPreferences localStorage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localStorage = await SharedPreferences.getInstance();
  authToken = localStorage.getString("token");
  if ((DateTime.tryParse(localStorage.getString("expiration") ?? "") ??
          DateTime.now())
      .isBefore(DateTime.now())) {
    authToken = null;
    localStorage.remove("token");
  } else {
    await HttpRepository().refreshToken();
  }
  if (authToken != null) {
    await HttpRepository().getUserData();
    await HttpRepository().loadAllPlayersList();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageViewCubit>(
            create: (context) => PageViewCubit(currentPageIndex: 0)),
        BlocProvider<OpponentCubit>(
          create: (context) =>
              OpponentCubit(opponentID: null, name: null, surname: null),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: authToken == null ? LoginScreen() : HomeScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
