import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:perfect_pitch_flutter/screens/home.dart';
import 'package:perfect_pitch_flutter/settings/settings_storage.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

void main() {
  runApp(const MyApp());
  setWindowSize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsWrapper(
      storage: SettingsStorage(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: HexColor('#fdf5e6')
        ),
        home: const Home(),
      )
    );
  }
}

Future setWindowSize() async {
  await DesktopWindow.setWindowSize(const Size(720/1.75, 1280/1.75));
}
