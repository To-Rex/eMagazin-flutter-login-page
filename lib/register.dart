import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Register> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Register> {
  final _login = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _login.dispose();
    _email.dispose();
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
                "Create your account",
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
                  controller: _email,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[900]),
                      hintText: "email",
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
                    print("salom");
                  } else {
                    print("alik");
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
                      borderRadius: BorderRadius.circular(10.0)),
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
            const Expanded(child: Text(" ")),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have account?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Dubai",
                        fontSize: 14),
                  ),
                  TextButton(
                    child: const Text(
                      "Login",
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
                              builder: (context) => const MyHomePage(
                                    title: 'Login',
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
