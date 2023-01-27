import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise.dart';

class ExerciseUnison extends Exercise {
  ExerciseUnison({required super.context, required super.player});

  final int chordTones = 2;
  List<String> pitchOrder = [];
  List<String> octavesOrder = [];
  List<String> answerChord = [];
  List<String> correctChord = [];
  List<String> answerOrder = [];
  String chordInput = 'Answer: ';
  Color chordInputColor = Colors.black;

  @override
  void startDrill() {
    currentOctave = getRandomSelection(octavePool);
    List<String> notes = [];
    for (var i = 0; i < chordTones; i++) {
      final pitch = getRandomSelection(pitchPool);
      final octave = getRandomSelection(octavePool);
      notes.add(pitch+octave);
    }

    notes.sort((a, b) => 
      int.tryParse(a.substring(a.length-1))!.compareTo(
        int.tryParse(b.substring(b.length-1))!
      )
    );
    pitchOrder = notes.map((e) => e.substring(0, e.length-1)).toList();
    octavesOrder = notes.map((e) => e.substring(e.length-1)).toList();
    correctChord = notes;

    if(kDebugMode) print(notes);
    drillCount++;
    player.playUnison(correctChord);
  }
  
  @override
  void nextDrill() {
    answered = false;
    initButtonColors();
    clearInputChord();
    startDrill();
  }

  @override
  void onPitchClick(String key) {
    if (answered || answerOrder.length==chordTones) {
      return;
    }
    answerOrder.add(key);
    chordInput+='$key ';
  }

  void resetAnswer() {
    if (answered) {
      return;
    }
    answerOrder.clear();
    chordInput = 'Answer: ';
  }

  void checkAnswer() {
    if (answered) {
      player.playUnison(answerChord);
      return;
    }

    if (answerOrder.length != chordTones) {
      return;
    }

    Function eq = const ListEquality().equals;
    if (eq(answerOrder, pitchOrder)) {
        chordInputColor = Colors.greenAccent.shade700;
        correctAnswers++;
    } else {
        chordInputColor = Colors.redAccent.shade700;
    }

    List<String> notes = [];

    for (var i = 0; i < answerOrder.length; i++) {
      notes.add(answerOrder[i]+octavesOrder[i]);
    }
    answerChord = notes;
    player.playUnison(answerChord);
    answered = true;
  }

  void clearInputChord() {
    if (answered) {
      return;
    }
    answerOrder.clear();
    pitchOrder.clear();
    octavesOrder.clear();
    correctChord.clear();
    answerChord.clear();

    chordInput = 'Answer: ';
    chordInputColor = Colors.black;
  }
  
  @override
  void repeat() {
    player.playUnison(correctChord);
  }
}