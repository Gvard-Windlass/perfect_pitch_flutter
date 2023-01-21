import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_unison.dart';
import 'exercise_provider.dart';

class ExerciseWrapper extends StatefulWidget {
  const ExerciseWrapper({super.key, required this.child, required this.exercise});
  final Widget child;
  final Exercise exercise;

  static ExerciseWrapperState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExerciseProvider>()?.data;
  }

  static ExerciseWrapperState of(BuildContext context) {
    final ExerciseWrapperState? result = maybeOf(context);
    assert(result != null, 'No exercise widget found in context');
    return result!;
  }

  @override
  State<ExerciseWrapper> createState() => ExerciseWrapperState();
}

// data and methods go here
class ExerciseWrapperState extends State<ExerciseWrapper> {
  int get correctAnswers => widget.exercise.correctAnswers;
  int get drillCount => widget.exercise.drillCount;
  
  String get chordInput => (widget.exercise as ExerciseUnison).chordInput;
  
  Color get chordInputColor => (widget.exercise as ExerciseUnison).chordInputColor;
  Map<String, Color> get buttonColors => widget.exercise.buttonColors;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.exercise.initExercise();
  }

  void onPitchClick(String key) {
    setState(() {
      widget.exercise.onPitchClick(key);
    });
  }

  void resetAnswer() {
    setState(() {
      (widget.exercise as ExerciseUnison).resetAnswer();
    });
  }

  void checkAnswerUnison() {
    setState(() {
      (widget.exercise as ExerciseUnison).checkAnswer();
    });
  }

  void nextDrill() {
    setState(() {
      widget.exercise.nextDrill();
    });
  }

  void repeat() {
    widget.exercise.repeat();
  }
  
  @override
  Widget build(BuildContext context) {
    return ExerciseProvider(data: this, child: widget.child);
  }
}