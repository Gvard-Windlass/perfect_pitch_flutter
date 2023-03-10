import 'dart:io';

import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_single.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_unison.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_wrapper.dart';
import 'package:perfect_pitch_flutter/player/player.dart';
import 'package:perfect_pitch_flutter/screens/drill.dart';
import 'package:perfect_pitch_flutter/screens/home.dart';
import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/settings/settings_storage.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isWindows) {
    setWindowSize();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsWrapper(
      storage: SettingsStorage(),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/drill': (context) {
            var exercise = SettingsWrapper.of(context).settings.exerciseMode == 
              ExerciseMode.singlePitch ? 
              ExerciseSingle(context: context, player: Player()) : 
              ExerciseUnison(context: context, player: Player());
            return ExerciseWrapper(exercise: exercise, child: const Drill());
          },
        },
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: HexColor('#fdf5e6')
        ),
      )
    );
  }
}

Future setWindowSize() async {
  await DesktopWindow.setWindowSize(const Size(720/1.75, 1280/1.75));
}
