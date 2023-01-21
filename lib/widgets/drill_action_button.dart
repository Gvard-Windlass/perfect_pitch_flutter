import 'package:flutter/material.dart';

class DrillActionButton extends StatelessWidget {
  const DrillActionButton({super.key, required this.action, required this.text, this.bgColor});
  final Function action;
  final String text;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        minimumSize: MaterialStateProperty.all(
          const Size(28, 42)
        )),
      onPressed: () => action(), 
      child: Text(text, style: const TextStyle(fontSize: 16))
    );
  }
}