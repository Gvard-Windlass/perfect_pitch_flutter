import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.icon, required this.route});
  final double minSize = 60;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(minSize, minSize)
        ),
        shape: MaterialStateProperty.all(
          const CircleBorder()
        )
      ), 
      child: Icon(icon, size: 26)
    );
  }
}