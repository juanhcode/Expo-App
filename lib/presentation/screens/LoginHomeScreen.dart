import 'package:expo_app/presentation/shared/buttonSign.dart';
import 'package:expo_app/presentation/shared/fieldLogin.dart';
import 'package:expo_app/presentation/shared/googleSign.dart';
import 'package:flutter/material.dart';

class LoginHomeScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  LoginHomeScreen({super.key});

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
                onTap: () {
                  print(usernameController.text);
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
              ButtonGoogle(image:"https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
            ],
          ),
        ),
      ),
    );
  }
}
