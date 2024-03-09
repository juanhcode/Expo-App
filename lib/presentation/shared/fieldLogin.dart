import 'package:flutter/material.dart';

class FieldCustom extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintTex;
  final bool obscureText;

  const FieldCustom(
      {super.key,
      required this.controller,
      required this.hintTex,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: const Color.fromARGB(255, 232, 229, 229),
            filled: true,
            hintText: hintTex),
      ),
    );
  }
}
