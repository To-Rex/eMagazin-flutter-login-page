import 'package:emagazin/password.dart';
import 'package:emagazin/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login'),
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
  final _login = TextEditingController();
  final _password = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(child: Text(" ")),
            const SizedBox(
              width: 300,
              child: Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  autofocus: false,
                  controller: _login,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[900]),
                      hintText: "login",
                      fillColor: Colors.grey[300]),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                autofocus: false,
                controller: _password,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[900]),
                    hintText: "password",
                    fillColor: Colors.grey[300]),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  if (_login.text == _password.text) {
                    //inter register page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordPage(
                                title: 'password',
                              )),
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueGrey, Colors.blueGrey],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: Colors.red, fontFamily: "Dubai", fontSize: 14),
                    ),
                    onPressed: () {
                      //Get.to(ForgetPassword());
                    },
                  )
                ],
              ),
            ),
            const Expanded(child: Text(" ")),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Dubai",
                        fontSize: 14),
                  ),
                  TextButton(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "Dubai",
                          fontSize: 18),
                    ),
                    onPressed: () {
                      if (_login.text == _password.text) {
                        //inter register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register(
                                    title: 'register',
                                  )),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
