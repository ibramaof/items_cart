import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;
  Buttons({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 50,
          child: MaterialButton(
            color: Color(0xFFA2D2FF),
            onPressed: onPressed,
            child: Text(buttonName, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
