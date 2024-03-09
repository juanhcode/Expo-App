import 'package:flutter/material.dart';

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hola"),),
      body: const Center(
        child: Text("Segunda pantalla"),
      ),
    );
  }
}