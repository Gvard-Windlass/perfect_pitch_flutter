import 'package:json_annotation/json_annotation.dart';

part 'settings_model.g.dart';

enum ExerciseMode {singlePitch, unison}

@JsonSerializable(explicitToJson: true)
class Settings {
  final List<String> _pitches = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
  final List<String> _octaves = ['1', '2', '3', '4', '5', '6', '7'];

  Settings({required this.pitchSelection, required this.octaveSelection, required this.exerciseMode});
  
  Settings.initial() {
    final defaultPitches = ['E', 'F#'];
    final defaultOctaves = ['1', '2', '4', '5'];

    pitchSelection = Map.fromIterable(_pitches, value: (pitch) => defaultPitches.contains(pitch));
    octaveSelection = Map.fromIterable(_octaves, value: (octave) => defaultOctaves.contains(octave));
    exerciseMode = ExerciseMode.singlePitch;
  }

  @JsonKey(name: 'pitch_selection')
  late Map<String, bool> pitchSelection;
  @JsonKey(name: 'octave_selection')
  late Map<String, bool> octaveSelection;
  @JsonKey(name: 'exercise_mode')
  late ExerciseMode exerciseMode;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}