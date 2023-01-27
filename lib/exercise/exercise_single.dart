import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise.dart';

class ExerciseSingle extends Exercise {
  ExerciseSingle({required super.context, required super.player});
  String currentPitch = '';

  @override
  void startDrill() {
    currentPitch = getRandomSelection(pitchPool);
    currentOctave = getRandomSelection(octavePool);
    drillCount++;
    if(kDebugMode) print(currentPitch+currentOctave);
    player.playSingle(currentPitch, currentOctave);
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
    if(kDebugMode) print(key == currentPitch);

    if (key != currentPitch) {
      buttonColors[key] = Colors.red;
    } else {
      correctAnswers++;
    }

    buttonColors[currentPitch] = Colors.lightGreen;
    answered = true;
  }
  
  @override
  void repeat() {
    player.playSingle(currentPitch, currentOctave);
  }

}