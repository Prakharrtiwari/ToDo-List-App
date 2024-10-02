import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key,
  required this.text,
  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color:  Color.fromRGBO(255,153,51, 5),
      child: Text(text),

    );
  }
}
