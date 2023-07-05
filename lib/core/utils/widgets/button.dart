import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade200,
          elevation: 10,
          shadowColor: AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
        ),
        onPressed: () {
          HapticFeedback.mediumImpact();
          widget.onPressed();
        },
        child: Text(
          widget.text.toUpperCase(),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
