// ignore: file_names
import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BuildContext, Colors, Container, EdgeInsets, GestureDetector, Image, StatelessWidget, Widget;

class ButtonGoogle extends StatelessWidget {
  final String image;
  const ButtonGoogle({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white38),
        child: Image.network(image,height: 70,),
      ),
    );
  }
}
