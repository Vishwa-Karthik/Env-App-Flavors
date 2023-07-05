import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class SignOns extends StatelessWidget {
  const SignOns({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.color = Colors.black,
  });

  final IconData assetPath;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(assetPath),
        color: color,
        iconSize: 25,
      )),
    );
  }
}
