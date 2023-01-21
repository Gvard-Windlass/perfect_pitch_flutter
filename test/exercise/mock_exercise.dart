import 'package:perfect_pitch_flutter/exercise/exercise_single.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_unison.dart';
import 'package:perfect_pitch_flutter/settings/settings_model.dart';

class MockExerciseSingle extends ExerciseSingle {
  MockExerciseSingle({required super.context, required super.player});
  
  @override
  void initPools() {
    pitchPool = [
      for (MapEntry pitchSetting in Settings.initial().pitchSelection.entries)
        if (pitchSetting.value) pitchSetting.key
    ];
    octavePool = [
      for (MapEntry pitchSetting in Settings.initial().octaveSelection.entries)
        if (pitchSetting.value) pitchSetting.key
    ];
  }

  @override
  void initButtonColors() {
    for (MapEntry pitchSetting in Settings.initial().pitchSelection.entries) {
      buttonColors[pitchSetting.key] = 
      getPitchButtonBackgroundColor(pitchSetting.key, pitchSetting.value);
    }
  }
}

class MockExerciseUnison extends ExerciseUnison {
  MockExerciseUnison({required super.context, required super.player});
  
  @override
  void initPools() {
    pitchPool = [
      for (MapEntry pitchSetting in Settings.initial().pitchSelection.entries)
        if (pitchSetting.value) pitchSetting.key
    ];
    octavePool = [
      for (MapEntry pitchSetting in Settings.initial().octaveSelection.entries)
        if (pitchSetting.value) pitchSetting.key
    ];
  }

  @override
  void initButtonColors() {
    for (MapEntry pitchSetting in Settings.initial().pitchSelection.entries) {
      buttonColors[pitchSetting.key] = 
      getPitchButtonBackgroundColor(pitchSetting.key, pitchSetting.value);
    }
  }
}