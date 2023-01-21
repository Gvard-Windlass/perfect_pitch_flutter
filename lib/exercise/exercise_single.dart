import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise.dart';

class ExerciseSingle extends Exercise {
  ExerciseSingle({required super.context});
  String currentPitch = '';

  @override
  void startDrill() {
    currentPitch = getRandomSelection(pitchPool);
    currentOctave = getRandomSelection(octavePool);
    drillCount++;
    print(currentPitch+currentOctave);
  }

  @override
  void nextDrill() {
    answered = false;
    initButtonColors();
    startDrill();
  }

  @override
  void onPitchClick(String key) {
    if (answered) {
      return;
    }
    print(key == currentPitch);

    if (key != currentPitch) {
      buttonColors[key] = Colors.red;
    } else {
      correctAnswers++;
    }

    buttonColors[currentPitch] = Colors.lightGreen;
    answered = true;
  }

}