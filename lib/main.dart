import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
  setWindowSize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        canvasColor: HexColor('#fdf5e6')
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Future setWindowSize() async {
  await DesktopWindow.setWindowSize(const Size(720/1.75, 1280/1.75));
}
