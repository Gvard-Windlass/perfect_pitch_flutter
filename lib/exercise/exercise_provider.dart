import 'package:flutter/material.dart';
import 'exercise_wrapper.dart';

class ExerciseProvider extends InheritedWidget {
  const ExerciseProvider({super.key, required super.child, required this.data});
  final ExerciseWrapperState data;

  @override
  bool updateShouldNotify(ExerciseProvider oldWidget) => oldWidget != this;
}