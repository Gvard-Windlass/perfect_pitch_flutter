import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_wrapper.dart';

class ChordInputText extends StatelessWidget {
  const ChordInputText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ExerciseWrapper.of(context).chordInput, 
      style: TextStyle(
        color: ExerciseWrapper.of(context).chordInputColor, 
        fontSize: 16.5,
        fontWeight: FontWeight.w500
      )
    );
  }
}