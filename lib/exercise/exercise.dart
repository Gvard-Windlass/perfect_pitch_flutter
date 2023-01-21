import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

abstract class Exercise {
  Exercise({required this.context});
  BuildContext context;

  List<String> pitchPool = [];
  List<String> octavePool = [];
  Map<String, Color> buttonColors = {};

  String currentOctave = '';
  int correctAnswers = 0;
  int drillCount = 0;
  bool answered = false;

  // ANCHOR - init

  void initExercise() {
    initButtonColors();
    initPools();
    startDrill();
  }

  void initButtonColors() {
    for (MapEntry pitchSetting in SettingsWrapper.of(context).settings.pitchSelection.entries) {
      buttonColors[pitchSetting.key] = 
      getPitchButtonBackgroundColor(pitchSetting.key, pitchSetting.value);
    }
  }

  void initPools() {
    pitchPool = SettingsWrapper.of(context).activePitches;
    octavePool = SettingsWrapper.of(context).activeOctaves;
  }

  // ANCHOR - main methdos

  void startDrill();
  void nextDrill();
  void onPitchClick(String key);

  // ANCHOR - utility methods

  Color getPitchButtonBackgroundColor(String key, bool enabled) {
    if (key.contains('#')) {
      if (!enabled) {
        return Colors.grey[300]!;
      }
      return const Color.fromARGB(255, 35, 35, 35);
    } else {
      if (!enabled) {
        return Colors.grey.shade100;
      }
      return Colors.white;
    }
  }

  String getRandomSelection(List pool) {
    var generator = Random();
    int index = generator.nextInt(pool.length);
    return pool[index];
  }
}