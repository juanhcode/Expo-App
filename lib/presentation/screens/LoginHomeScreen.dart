import 'package:dio/dio.dart';
import 'package:expo_app/presentation/screens/SpotifyScreen.dart';
import 'package:expo_app/presentation/shared/buttonSign.dart';
import 'package:expo_app/presentation/shared/fieldLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginHomeScreen extends StatefulWidget {
  const LoginHomeScreen({super.key});

  @override
  State<LoginHomeScreen> createState() => _LoginHomeScreenState();
}

class _LoginHomeScreenState extends State<LoginHomeScreen> {
  final usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  final passwordController = TextEditingController();
  final dio = Dio();
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.add_task_rounded,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FieldCustom(
                controller: usernameController,
                hintTex: 'Username',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FieldCustom(
                controller: passwordController,
                hintTex: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonSign(
                onTap: () async {
                  Response response;
                  dio.options.baseUrl = "http://localhost:8040";
                  try {
                    response = await dio.post('/v1/login', data: {
                      'user': usernameController.text,
                      'password': passwordController.text
                    });
                    print(response.statusCode);
                    print(response.data.toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SpotifyScreen()));
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.9,
                      color: Colors.grey,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or"),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.9,
                      color: Colors.grey,
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SignInButton(
                Buttons.google,
                onPressed: () {
                  try {
                    GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
                    _auth.signInWithProvider(_googleAuthProvider).then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SpotifyScreen())));
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
