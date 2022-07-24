import "imports.dart";
import "package:http/http.dart" as http;

class HttpRepository {
  HttpRepository();
  registerUser() async {
    String url = "http://bonk-bonk.herokuapp.com/api/auth/sign-up/";
    var response = await http.post(Uri.parse(url), body: user.toJson());
    print(response.body);
    print(response.statusCode);
  }
}
